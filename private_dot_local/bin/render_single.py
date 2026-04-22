import argparse
import math
import sys
from pathlib import Path


DEFAULT_IMAGE_SIZE = 1000
DEFAULT_JPEG_QUALITY = 50


def parse_args(argv):
    parser = argparse.ArgumentParser(
        description=(
            "Render a single STL file to a single JPEG. "
            "When running through Blender, pass script arguments after '--'."
        )
    )
    parser.add_argument(
        "input_stl",
        type=Path,
        help="Path to the STL file to render.",
    )
    parser.add_argument(
        "-o",
        "--output",
        type=Path,
        help="Full output path for the rendered JPEG. Defaults to the input path with a .jpeg suffix.",
    )
    return parser.parse_args(argv)


def get_script_argv():
    if "--" in sys.argv:
        return sys.argv[sys.argv.index("--") + 1 :]
    return sys.argv[1:]


def clear_scene(bpy):
    bpy.ops.object.select_all(action="SELECT")
    bpy.ops.object.delete(use_global=False)


def configure_camera_and_light(bpy):
    camera_data = bpy.data.cameras.new(name="Camera")
    camera = bpy.data.objects.new("Camera", camera_data)
    bpy.context.collection.objects.link(camera)
    bpy.context.scene.camera = camera
    camera.location = (2, -2, 2)
    camera.rotation_euler = (math.radians(55), 0, math.radians(47))

    light_data = bpy.data.lights.new(name="Light", type="AREA")
    light_data.energy = 900
    light = bpy.data.objects.new(name="Light", object_data=light_data)
    light.location = (5, -5, 10)
    bpy.context.collection.objects.link(light)


def configure_scene_rendering(scene):
    scene.render.image_settings.file_format = "JPEG"
    scene.render.image_settings.quality = DEFAULT_JPEG_QUALITY
    scene.render.resolution_x = DEFAULT_IMAGE_SIZE
    scene.render.resolution_y = DEFAULT_IMAGE_SIZE
    scene.render.use_file_extension = False


def clear_mesh_objects(bpy):
    bpy.ops.object.select_all(action="DESELECT")
    for obj in bpy.context.scene.objects:
        if obj.type == "MESH":
            obj.select_set(True)
    bpy.ops.object.delete()


def load_part_object(bpy, stl_path):
    clear_mesh_objects(bpy)
    bpy.ops.wm.stl_import(filepath=str(stl_path))
    selected_objects = list(bpy.context.selected_objects)
    if not selected_objects:
        raise SystemExit(f"STL import produced no objects: {stl_path}")
    return selected_objects[0]


def center_and_scale(bpy, obj):
    bpy.context.view_layer.objects.active = obj
    bpy.ops.object.origin_set(type="ORIGIN_GEOMETRY", center="BOUNDS")
    obj.location = (0, 0, 0)
    obj.rotation_euler = (0, 0, math.radians(-80))

    max_dim = max(obj.dimensions)
    if max_dim > 0:
        scale = 1.5 / max_dim
        obj.scale = (scale, scale, scale)
        bpy.ops.object.transform_apply(scale=True)


def render_stl(bpy, scene, input_stl, output_path):
    obj = load_part_object(bpy, input_stl)
    center_and_scale(bpy, obj)

    output_path.parent.mkdir(parents=True, exist_ok=True)
    temp_path = output_path.with_name(f".{output_path.name}.tmp")

    scene.render.filepath = str(temp_path)
    bpy.ops.render.render(write_still=True)

    if not temp_path.is_file():
        raise SystemExit(f"Render did not produce output: {temp_path}")

    temp_path.replace(output_path)


def main():
    args = parse_args(get_script_argv())
    input_stl = args.input_stl.expanduser().resolve()
    output_path = (args.output or input_stl.with_suffix(".jpeg")).expanduser().resolve()

    if not input_stl.is_file():
        raise SystemExit(f"Input STL does not exist: {input_stl}")

    if input_stl.suffix.lower() != ".stl":
        raise SystemExit(f"Input file must be an STL: {input_stl}")

    try:
        import bpy
    except ImportError as exc:
        raise SystemExit(
            "render_single.py must be run with Blender's Python environment "
            "(for example: blender --background --python render_single.py -- <file.stl>)."
        ) from exc

    clear_scene(bpy)
    configure_camera_and_light(bpy)
    scene = bpy.context.scene
    configure_scene_rendering(scene)
    render_stl(bpy, scene, input_stl, output_path)

    print(f"rendered\t{input_stl}\t{output_path}")


if __name__ == "__main__":
    main()
