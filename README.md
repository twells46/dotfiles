# Dotfiles

These are my personal dotfiles.
I do not use all of these programs all the time, so some may be broken or out of date.

## Usage

I manage these using [chezmoi](https://www.chezmoi.io/).

To get started locally, initialize `chezmoi` with this repo:

```sh
chezmoi init https://git.wellsth.com/dotfiles.git
```

You can then see what `chezmoi` would change:

```sh
chezmoi diff
```

If you're happy with the changes, apply them:

```sh
chezmoi apply
```

The above commands can be combined into a single command to initialize, checkout, and apply:

```sh
chezmoi init --apply --verbose https://git.wellsth.com/dotfiles.git
```

> This was taken from the [chezmoi docs](https://www.chezmoi.io/user-guide/setup/).
> If something seems broken or for more detail, refer to that documentation.

Most of the directories are pretty self-explanatory -- just look up the program -- but here's a quick explanation of the less obvious ones:

- **service**: `runit` user services managed using `turnstiled`.
[More info](https://docs.voidlinux.org/config/services/user-services.html).
- **service-env**: Environment variables for turnstiled user services.
- **userjs**: My  `user.js` files for Firefox and friends.
`secure` is [Betterfox](https://github.com/yokoffing/BetterFox) with most of the security recommendation applied.
`default` is Betterfox with a more permissive stance.

## Chezmoi config

I set a few custom variables in my chezmoi config to reconcile differences between my machines:

- `gpg_key_git`: GPG key to use for git commit signing.
- `git_email`: Email address to use for git.
- `colors`: `light` or `dark`, applies theming to a few programs.
- `dp_scale`: Display scale for sway.
- `systemd`: `true` or `false`. Is `systemd` present on the system?

Set them in `chezmoi.toml` like this:

```toml
[data]
    gpg_key_git = "<key>"
    git_email = "<email>"
    colors = "light"
    dp_scale = "1.0"
    systemd = true
```
