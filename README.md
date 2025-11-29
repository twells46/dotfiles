# Dotfiles

These are my personal dotfiles.
The main branch tracks X11-compatable configuration, I will probably create another branch to track Wayland versions later.
I do not use all of these programs all the time (that's why there are five different editor configs), so some may be broken or out of date.

## Usage

I manage these using GNU stow.
Clone this repo into your home directory, then stow whichever configurations you want to use.
For example, to use the fish config:

```bash
stow fish
```

Most of the directories are pretty self-explanatory (just look up the program), but here's a quick explanation of the less obvious ones:

- **service**: `runit` user services managed using `turnstiled`.
[More info](https://docs.voidlinux.org/config/services/user-services.html).
- **service-env**: Environment variables for user services.
- **shell**: Useful environment variables for interactive shell usage.
This sets the variables for `dash` (user shell), which are inherited by `fish`, which I call explicitly when opening a terminal window (i.e. `st /usr/bin/fish`).
