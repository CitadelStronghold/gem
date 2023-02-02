# Setup
- [Home](https://github.com/GeodeGames/gem)
- Based off of this [video guide](https://www.youtube.com/watch?v=DPLnBPM4DhI)

# Partitioning

> fdisk -l
- List disks
- Note your disk you want to install to: /dev/sda

> fdisk /dev/sda

> p

> g

> n
- Enter
- Enter
- +2g
    - Your boot partition size

> t

> 1
- Changed type to 'EFI System'

> p

> n
- Enter
- Enter
- Enter

> t
- Enter
- 43
    - Changed type to 'Linux LVM'
    - There are no downsides to using the LVM type

> p
- You see 'EFI System', 'Linux LVM'

> w

## Formatting / LVM Setup
> mkfs.fat -F32 /dev/sda1

> pvcreate --dataalignment 1m /dev/sda2

> vgcreate volgroup0 /dev/sda2

##
> lvcreate -L 24GB volgroup0 -n lv_root
- `pacman` will store packages here, you need some space
- You can purge /var/cache/pacman/pkg/ if you run out
- See below for automatic cleaning of this

> lvcreate -l 100%FREE volgroup0 -n lv_home

> modprobe dm_mod
- Load kernel module into kernel

> vgscan

> vgchange -ay

## D
> mkfs.ext4 /dev/volgroup0/lv_root

> mount /dev/volgroup0/lv_root /mnt

> mkfs.ext4 /dev/volgroup0/lv_home

> mkdir /mnt/home

> mount /dev/volgroup0/lv_home /mnt/home

> mkdir /mnt/etc

> genfstab -U -p /mnt >> /mnt/etc/fstab

> cat /mnt/etc/fstab
- You see two entries: `/`, `/home`

## Gem
> bash /opt/gem/gem.sh /mnt
- Installs [gem](https://github.com/GeodeGames/gem) scripts into `/mnt/opt/gem`

## Pacstrap
> pacstrap -i /mnt base

## Base Packages
> arch-chroot /mnt

> pacman -S linux linux-headers

> pacman -S linux-lts linux-lts-headers
- Pick one of the above lines, or do both based on your desired stability
- Having multiple kernels can save you if something is incompatible with the newer one
- You may select which one at boot
- *Accept the default package provider*

#> pacman -S base-devel
#- Probably will need it
#- *Accept the default package provider*

> bash /opt/gem/s/dev.sh

> bash /opt/gem/s/net/core.sh

> bash /opt/gem/s/net/wifi.sh
- Optional

---

> pacman -S lvm2
- Required regardless of partitioning setup type

> vim /etc/mkinitcpio.conf
- Find HOOKS=
- Add lvm2 between block and filesystems

> mkinitcpio -p linux

> mkinitcpio -p linux-lts
- Only if you also installed LTS

---

> vim /etc/locale.gen
- Find yours (en_US.UTF-8)

> locale-gen
- You should see it be generated

---

> passwd
- Root user password

---

> useradd -m -g users -G wheel \<username\>
- -m makes a home
- -g is initial group
- wheel is a group for administrative commands

> passwd \<username\>

> which sudo
- Prove sudo is installed

> EDITOR=vim visudo
- Uncomment the "%wheel ALL=..." line

## GRUB

> pacman -S grub efibootmgr dosfstools os-prober mtools

> mkdir /boot/EFI

> mount /dev/sda1 /boot/EFI

> grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck

> mkdir -p /boot/grub/locale
- It probably already exists, can check and see

> cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo

> grub-mkconfig -o /boot/grub/grub.cfg
- Grub config is in /etc/default/grub, configure it before running if you want

> exit

> umount -a
- Errors here are fine

# Pacman Configuration

> vim /etc/pacman.conf
- Uncomment #ParallelDownloads

> pacman -S pacman-contrib

> paccache -r

> systemctl start paccache.timer

> systemctl status paccache.timer

## Swap Partition (Not Strictly Necessary)
- Swap files can be altered without editing partition table

> su

> cd /root

> dd if=/dev/zero of=/swapfile bs=1M count=2048 status=progress

> chmod 600 /swapfile

> mkswap /swapfile

> cp /etc/fstab /etc/fstab.bak
- Backs it up

> echo '/swapfile none swap sw 0 0' | tee -a /etc/fstab

> cat /etc/fstab
- You see the /swapfile entry at the bottom

> free -m

> mount -a
- Tests fstab configuration

> swapon -a
> free -m

## Timezone Configuration

> timedatectl list-timezones

> timedatectl set-timezone America/Denver

> systemctl enable systemd-timesyncd

## Hostname

> hostnamectl set-hostname \<hostname\>

> cat /etc/hostname

> vim /etc/hosts
- 127.0.0.1 localhost
- 127.0.0.1 \<hostname\>

> hostnamectl

## [Microcode](https://wiki.archlinux.org/title/microcode#:~:text=These%20updates%20provide%20bug%20fixes,updates%20to%20ensure%20system%20stability.)
- All arch users should install the right microcode for their processor, to ensure stability

> pacman -S amd-ucode

> pacman -S intel-ucode
- Pick one of the above lines

---

> reboot
