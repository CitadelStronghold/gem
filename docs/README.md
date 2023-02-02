# Gem
Gem is an Arch Linux ISO distribution with convenient configuration scripts.

A base installation is exactly the same as Arch Linux.

Extra functionality is then added through the use of scripts available in the `/opt/gem` directory.

## Installation

1. Download the ISO from the [releases](https://github.com/GeodeGames/gem/releases)
2. Boot into the ISO on the desired machine
3. Install Arch Linux + Gem
    1. [Guide](Setup.md)
    2. [Gem Installation Instructions](Setup.md#gem)

## Philosophy

1. Multiple runs of a script produce the same result as a single run
2. All scripts come with a removal script to undo the changes
3. Scope of a script is as limited as possible

## Usage

### Core

> bash /opt/gem/gem.sh \<folder\>
- Copies `/opt/gem` into `<folder>`
- Used during [installation](Setup.md#gem)

> bash /opt/gem/update.sh
- Update all scripts via [the git repository](https://github.com/GeodeGames/gem-scripts)

### Packages

> #### [BTOP](github.com/aristocratos/btop)
> &nbsp;
> bash /opt/gem/s/btop.sh
> &nbsp;
> &nbsp;
> ![Sample](https://github.com/aristocratos/btop/raw/main/Img/normal.png)

## [Releases](https://github.com/GeodeGames/gem/releases)
The only supported architecture at present is `x86_64`.

## Submodules
- [gem-scripts](https://github.com/GeodeGames/gem-scripts)
    - `gem-scripts` is copied to `/opt/gem`