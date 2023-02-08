# Gem

Gem is an Arch Linux ISO distribution with convenient configuration scripts.

A base installation is exactly the same as Arch Linux.

Extra functionality is then added through the use of the `gem` command.

The official and default interface is [Hyprland](https://github.com/hyprwm/Hyprland.git).

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
1. If you are using an `nvidia` card, run `gem s nvidia`
    - `gem c init`
        - Add `nvidia nvidia_modeset nvidia_uvm nvidia_drm` to `MODULES`
        - Remove `kms` from hooks
    - `gem c grub`
        - Change `GRUB_CMDLINE_LINUX=""` to `GRUB_CMDLINE_LINUX="nvidia-drm.modeset=1"`
1. Install the gui gem: `gem s gui`
1. Install the gui config defaults: `gem s config/gui`
1. Install the fonts: `gem s fonts`
1. Reboot
    - Select Hyprland in the dropdown
1. Go through the gems below and install as needed
1. Configure `git`
    - `git config --global user.email "you@example.com"`
    - `git config --global user.name "Name"`
1. Reboot again
1. Configure monitors from `gem c hypr`

## Philosophy

1. Multiple runs of a script produce the same result as a single run
1. All scripts come with uninstall functionality, to undo their changes
    - This is only partially supported, because some gems share dependencies
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

> > **gem c init**
>
> > Modify `/etc/mkinitcpio.conf`, then runs `mkinitcpio -P` for you

---

> > **gem c grub**
>
> > Modify `/etc/default/grub`, then runs `gem s config/grub` for you

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
>
> > Note: You will have to manually adjust the font to one that supports emojis
>
> > Note: You will have to manually install userstyles
>
> > Note: You will have to go to `chrome://flags` and manually disable smooth scrolling
>
> > Note: You will have to go to `chrome://flags` and manually enable GPU rendering
>
> > Note: If you do not want Chrome scaling, adjust it via `gem c hypr`
>
> > Google Chrome

---

> > **gem s [code](https://github.com/microsoft/vscode)**
>
> > Visual Studio Code, Variant AUR `google-chrome`
>
> > Depends on `gem s chrome` for web authentication
>
> > Note: You will have to enter your `Monokai Pro` key again, if you have one
>
> > Note: You will also likely need `gem s clang`

---

> > **gem s [btop](https://github.com/aristocratos/btop)**
>
> > **Warning: Overrides config!**
>
> > - `btop`
>
> > ![Sample](https://github.com/aristocratos/btop/raw/main/Img/normal.png)

---

> > **gem s cute**
>
> > - AUR `cbonsai`
> > - `neofetch`

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

> > ~~**gem s [flameshot](https://flameshot.org)**~~
>
> > **Not working!**
>
> > `flameshot`

---

> > **gem s obs**
>
> > **Not working!**
>
> > `obs-studio`

---

> > **gem s screenshot**
>
> > Test by hitting `Print Screen`
>
> > See [swappy](https://github.com/jtheoof/swappy)
>
> > - `grim`
> > - `slurp`
> > - `swappy`
> > - `wl-clipboard`

---

> > **gem s steam**
>
> > - `steam`

---

> > **gem s vlc**
>
> > - `vlc`

---

> > **gem s [remapper](https://github.com/sezanzeb/input-remapper.git)**
>
> > - AUR `input-remapper-git`
>
> > Note: Run `input-remapper-gtk` and configure your peripherals

---

> > **gem s spotify**
>
> > [spotify-qt](https://github.com/kraxarn/spotify-qt)
>
> > 1. Set `Settings` > `Spotify` > `General` to `/usr/bin/spotifyd`
>
> > 2. Set `Settings` > `Spotify` > `Configuration` > `Use global config` to `true`
>
> > 3. Configure `~/.config/spotifyd/spotifyd.conf`

---

> > **gem s veracrypt**
>
> > `veracrypt`

---

> > **gem s nvm**
>
> > [nvm](https://github.com/nvm-sh/nvm)
>
> > `nvm install 18`

---

> > **gem s docker**
>
> > `docker`

---

> > **gem s clang**
>
> > `clang`

---

> > **gem s [numlock](https://wiki.archlinux.org/title/Activating_numlock_on_bootup)**
>
> > - AUR `mkinitcpio-numlock`
> >
> > 1. `gem c init`
>
> > 2. Add `numlock` (Before encrypt, if you have it)

---

> > **gem s [brisqi](https://brisqi.com)**
>
> > Note: Establishes auto-backup functionality. The gem would need to be customized to use your own repository beforehand.
>
> > Note: You may have to reboot before you can sign in
>
> > Note: Be sure to export a backup once signed in, then reboot in order to auto-backup

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

> > **gem s config/grub**
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
>
> > Note: Try to do this while you are not running the `Hyprland` binary...

---

> > **gem s config/gui**
>
> > **Warning: This overrides all configs**
>
> > 1. Copy distribution-default configurations for the GUI tools

---

## [Releases](https://github.com/GeodeGames/gem/releases)
The only supported architecture at present is `x86_64`.

## **Other Notes**

- [No Sudo Delay on Failure](https://unix.stackexchange.com/questions/658771/remove-delay-after-wrong-sudo-password-entry-on-arch-linux)

- Foot Terminal Copy Paste
    - <kbd>Ctrl</kbd> <kbd>Shift</kbd> <kbd>C</kbd> / <kbd>Ctrl</kbd> <kbd>Shift</kbd> <kbd>V</kbd>

## Resources

- [arewewaylandyet?](https://arewewaylandyet.com/)

## Submodules
- [gem-scripts](https://github.com/GeodeGames/gem-scripts)
    - `gem-scripts` is copied to `/opt/gem` on installations and in the ISO
