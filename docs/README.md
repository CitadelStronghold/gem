# Gem

Gem is an Arch Linux ISO distribution with convenient configuration scripts.

A base installation is exactly the same as Arch Linux.

Extra functionality is then added through the use of the `gem` command.

The official interface is Hyprland.

## Example

```
# Update gems
> gem

# List gems
> gem tree

# Configure pacman for parallel downloads at $(nproc)
> gem s config/pacman

# Install BTOP
> gem s btop

# Undo the pacman configuration changes
> gem r config/pacman
```

## Installation

1. Download the ISO from the [releases](https://github.com/GeodeGames/gem/releases)
1. Boot into the ISO on the desired machine
1. Install Arch Linux + Gem
    1. [Guide](Setup.md)
    1. [Gem Installation Instructions](Setup.md#gem)
1. Install a display manager gem from `dm/`
    - IE `gem s dm/gdm`
1. Install the gui gem: `gem s gui`
1. Install the gui config defaults: `gem s config/gui`
1. Configure monitors from `gem c hypr`
1. Go through the gems below and install as needed

## Philosophy

1. Multiple runs of a script produce the same result as a single run
1. All scripts come with uninstall functionality, to undo their changes
1. Scope of a script is as limited as possible
1. All extended functionality is derived from a single command, `gem`
1. Any configuration changes that scripts make should be printed

## Gems

### /

---

> > **gem install \<folder\>**
>
> > Used during [installation](Setup.md#gem)
> >
> > Copies `/opt/gem` into `<folder>`
> >
> > Copies binaries into `/usr/bin`

---

> > **gem**
>
> > Update gem automatically

---

> > **gem s \<name\>**
>
> > Install a gem

---

> > **gem r \<name\>**
>
> > Uninstall a gem

---

> > **gem tree**
>
> > List all gems

---

> > **gem shutdown**
>
> > Shutdown the OS

---

> > **gem reboot**
>
> > Reboot the OS

---

### c

---

> > **gem c hypr**
>
> > Modify hyprland config

---

> > **gem c paper**
>
> > Modify hyprpaper config

---

> > **gem c foot**
>
> > Modify foot config

---

> > **gem c rofi**
>
> > Modify rofi config

---

> > **gem c rofimoji**
>
> > Modify rofimoji config

---

### /

---

> > **gem s dev**
>
> > - `git`
> > - `neovim`
> > - `helix`
> > - `exa`
> > - `which`
> > - `tree`
> > - `ninja`
> > - `cmake`
> > - `make`
> > - `get`
> > - `unzip`
> > - `fuse2`
> > - `base-devel`
>
> > Installs `yay`

---

> > **gem s fonts**
>
> > Install fonts
>
> > [`Iosevka`](https://github.com/be5invis/Iosevka)
> > [`Iosevka Glyphs`](https://nerdfonts.com)

---

> > **gem s zsh**
>
> > `zsh`
> > AUR `zsh-theme-powerlevel10k-git`

---

> > **gem s chrome**
>
> > Note: You will have to manually adjust the download folder to the lower-case variant
> > Note: You will have to manually adjust the font to one that supports emojis
>
> > Google Chrome

---

> > **gem s [code](https://github.com/microsoft/vscode)**
>
> > Visual Studio Code, Variant AUR `google-chrome`
>
> > Depends on `gem s chrome`

---

> > **gem s [btop](https://github.com/aristocratos/btop)**
>
> > **Warning: Overrides config!**
>
> > - `btop`
>
> > ![Sample](https://github.com/aristocratos/btop/raw/main/Img/normal.png)

---

> > **gem s audio**
>
> > - `alsa-utils`
>
> > Gives you `amixer` CLI

---

> > **gem s [joplin](https://joplinapp.org)**
>
> > Installs Joplin

---

> > **gem s [bitwarden](https://bitwarden.com)**
>
> > Installs BitWarden

---

> > **gem s [discord](https://discord.com)**
>
> > Installs Discord

---

> > **gem s vmware**
>
> > Installs VMware Workstation Pro

---

> > **gem s [flameshot](https://flameshot.org)**
>
> > **Not working!**
>
> > `flameshot`

---

> > **gem s screenshot**
>
> > See [swappy](https://github.com/jtheoof/swappy)
>
> > - `grim`
> > - `slurp`
> > - `swappy`
> > - `wl-clipboard`

---

> > **gem s [swaylock](https://github.com/swaywm/swaylock)**
>
> > - AUR `swaylock-effects`

---

> > **gem s cute**
>
> > - AUR `cbonsai`
> > - `neofetch`

---

> > **gem s steam**
>
> > - `steam`

---

> > **gem s [remapper](https://github.com/sezanzeb/input-remapper.git)**
>
> > - AUR `input-remapper-git`

---

> > **gem s spotify**
>
> > [spotify-qt](https://github.com/kraxarn/spotify-qt)

---

### net/

---

> > **gem s net/core**
>
> > Install `NetworkManager`

---

> > **gem s net/wifi**
>
> > WiFi Tools

---

### config/

---

> > **gem s config/pacman**
>
> > 1. Enable parallel downloads for packages
> > 1. Enable weekly pacman cache cleanup
> > 1. Clean the cache immediately

---

> > **gem s config/boot**
>
> > 1. Reduce GRUB delay down to one second
> > 1. Build the GRUB config

---

### dm/

---

> > **gem s dm/gdm**
>
> > 1. Install GDM
> > 1. Enable it

---

### gui

---

> > **gem s gui**
>
> > 1. Install Hyprland interface and other GUI tools

---

> > **gem s config/gui**
>
> > **Warning: This overrides all configs**
>
> > 1. Copy distribution-default configurations for the GUI tools

---

## [Releases](https://github.com/GeodeGames/gem/releases)
The only supported architecture at present is `x86_64`.

## Other Notes

- Foot Terminal Copy Paste
    - <kbd>Ctrl</kbd> <kbd>Shift</kbd> <kbd>C</kbd> / <kbd>Ctrl</kbd> <kbd>Shift</kbd> <kbd>V</kbd>
- [Numlock On Boot](https://wiki.archlinux.org/title/Activating_numlock_on_bootup)
    - The first solution is preferable
        - `yay -S mkinitcpio.conf`
        - `sudo helix /etc/mkinitcpio.conf`
        - Add `numlock` before encrypt
        - `mkinitcpio -P`

## Resources

- [arewewaylandyet?](https://arewewaylandyet.com/)

## Submodules
- [gem-scripts](https://github.com/GeodeGames/gem-scripts)
    - `gem-scripts` is copied to `/opt/gem` on installations and in the ISO