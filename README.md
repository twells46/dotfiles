# Dotfiles

These are my personal dotfiles.
I do not use all of these programs all the time (that's why there are five different editor configs), so some may be broken or out of date.

## Usage

I manage these using [chezmoi](https://www.chezmoi.io/).

To get started locally, initialize `chezmoi` with this repo:

```sh
chezmoi init https://git.wellsth.com/dotfiles.git
```

You can then see what would be changed:

```sh
chezmoi diff
```

If you're happy with the changes then apply them:

```sh
chezmoi apply
```

The above commands can be combined into a single command to initialize, checkout, and apply:

```sh
chezmoi init --apply --verbose https://git.wellsth.com/dotfiles.git
```

> This was taken from the [chezmoi docs](https://www.chezmoi.io/user-guide/setup/).
> If something seems broken or for more detail, refer to that documentation.

Most of the directories are pretty self-explanatory (just look up the program), but here's a quick explanation of the less obvious ones:

- **service**: `runit` user services managed using `turnstiled`.
[More info](https://docs.voidlinux.org/config/services/user-services.html).
- **service-env**: Environment variables for user services.
- **shell**: Useful environment variables for interactive shell usage.
This sets the variables for `dash` (user shell), which are inherited by `fish`, which I call explicitly when opening a terminal window (i.e. `st /usr/bin/fish`).
- **scripts**: Some scripts that I have written and used at various points in time.
Many of them are only really useful for quick reference, but there are a few actually useful ones.
