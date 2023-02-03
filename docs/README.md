# Gem

Gem is an Arch Linux ISO distribution with convenient configuration scripts.

A base installation is exactly the same as Arch Linux.

Extra functionality is then added through the use of the `gem` command.

## Example

```
# Update gems
> gem

# Configure pacman
> gem s config/pacman

# Install BTOP
> gem s btop
```

## Installation

1. Download the ISO from the [releases](https://github.com/GeodeGames/gem/releases)
2. Boot into the ISO on the desired machine
3. Install Arch Linux + Gem
    1. [Guide](Setup.md)
    2. [Gem Installation Instructions](Setup.md#gem)
4. Use the `gem` command as described below

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

### /

---

> > **gem s dev**
>
> > - `git`
> > - `vim`
> > - `which`
> > - `tree`

---

> > **gem s [btop](https://github.com/aristocratos/btop)**
>
> > - `btop`
>
> > ![Sample](https://github.com/aristocratos/btop/raw/main/Img/normal.png)

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

## [Releases](https://github.com/GeodeGames/gem/releases)
The only supported architecture at present is `x86_64`.

## Submodules
- [gem-scripts](https://github.com/GeodeGames/gem-scripts)
    - `gem-scripts` is copied to `/opt/gem`