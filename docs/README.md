# Gem
Gem is an Arch Linux ISO distribution with convenient configuration scripts.

There are no default changes from regular Arch Linux.

Instead, extra functionality is added through the use of scripts in the `/opt/gem` directory.

## Usage

1. Download the ISO from the [releases](https://github.com/GeodeGames/gem/releases)
2. Boot into the ISO on the desired machine
3. Install Arch Linux + Gem [Setup.md](Setup.md)
    - [Gem Installation Instructions](Setup.md#gem)
4. Utilize The Scripts
> bash /opt/gem/update.sh
    - Update the scripts

## [Releases](https://github.com/GeodeGames/gem/releases)
The only supported architecture at present is `x86_64`.

## Submodules
- [gem-setup](https://github.com/GeodeGames/gem-setup)
    - `gem-setup` is copied to `/opt/gem`