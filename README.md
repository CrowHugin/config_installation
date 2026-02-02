
### informations

This script need `apt` package manager and `git` installed.

---
### instalation

```bash
git clone https://github.com/CrowHugin/config_installation ~/&& cd ~/config_installation
```

and:

```bash
chmod u+x ./install.sh && ./install.sh
```

---
### fonts
Please be sure to set your terminal font to 0xProto Nerd Font.

---
### tmux

Use `Crtl-Space + I` inside tmux to load the plugins.

To enter copy mode use `Ctrl-Space + [`

Then use `v` to begin the selection,

`Ctrl-v` to toggle a rectangle

and `y` to copy inside the clipboard

For tmux command see [here](https://tmuxcheatsheet.com/)

See the config [here](https://github.com/CrowHugin/tmux-config)

---
### Nvim

Nvim treesitter will work after you launch nvim 2 or 3 times.

See the config [here](https://github.com/CrowHugin/nvim-config)

---
### Aliases

I added two more aliases:

`lse` which is `eza -lha --icons=auto --sort=name --group-directories-first`

for more info on eza see [here](https://github.com/eza-community/eza)

and `cl` as a shortcut to `Ctrl-l` or `clear` because `Ctrl-l` is used to change windows on tmux.

---
### Atuin
See info on atuin [here](https://atuin.sh/)

For it to work, you need to restart your terminal.