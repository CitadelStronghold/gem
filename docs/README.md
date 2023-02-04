# Gem

Gem is an Arch Linux ISO distribution with convenient configuration scripts.

A base installation is exactly the same as Arch Linux.

Extra functionality is then added through the use of the `gem` command.

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
2. Boot into the ISO on the desired machine
3. Install Arch Linux + Gem
    1. [Guide](Setup.md)
    2. [Gem Installation Instructions](Setup.md#gem)
4. Use the `gem` command as described below
5. Install a display manager gem from `dm/`
    - IE `gem s dm/gdm`
6. Install the gui gem: `gem s gui`

## Philosophy

1. Multiple runs of a script produce the same result as a single run
2. All scripts come with uninstall functionality, to undo their changes
3. Scope of a script is as limited as possible
4. All extended functionality is derived from a single command, `gem`
5. Any configuration changes that scripts make should be printed

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

### /

---

> > **gem s dev**
>
> > - `git`
> > - `vim`
> > - `which`
> > - `tree`
> > - `ninja`
> > - `cmake`
> > - `make`
> > - `wget`
> > - `unzip`
> > - `base-devel`
>
> > Installs `yay`

---

> > **gem s chrome**
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
> > 2. Enable weekly pacman cache cleanup
> > 3. Clean the cache immediately

---

> > **gem s config/boot**
>
> > 1. Reduce GRUB delay down to one second
> > 2. Build the GRUB config

---

### dm/

---

> > **gem s dm/gdm**
>
> > 1. Install GDM
> > 2. Enable it

---

### gui

---

> > **gem s gui**
>
> > 1. Install Hyprland interface and other GUI tools

---

> > **gem s config/gui**
>
> > 1. Copy distribution-default configurations for the GUI tools

---

## [Releases](https://github.com/GeodeGames/gem/releases)
The only supported architecture at present is `x86_64`.

## Other Notes

- Foot Terminal Copy Paste
    - <kbd>Ctrl</kbd> <kbd>Shift</kbd> <kbd>C</kbd> / <kbd>Ctrl</kbd> <kbd>Shift</kbd> <kbd>V</kbd>

## Resources

- [arewewaylandyet?](https://arewewaylandyet.com/)

## Submodules
- [gem-scripts](https://github.com/GeodeGames/gem-scripts)
    - `gem-scripts` is copied to `/opt/gem` on installations and in the ISO