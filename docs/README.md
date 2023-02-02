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

## Usage

> bash /opt/gem/update.sh
- Update all scripts via [the git repository](https://github.com/GeodeGames/gem-setup)

## [Releases](https://github.com/GeodeGames/gem/releases)
The only supported architecture at present is `x86_64`.

## Submodules
- [gem-setup](https://github.com/GeodeGames/gem-setup)
    - `gem-setup` is copied to `/opt/gem`