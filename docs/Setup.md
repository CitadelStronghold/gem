# Setup
- [Home](https://github.com/GeodeGames/gem)
- Based off of this [video guide](https://www.youtube.com/watch?v=DPLnBPM4DhI)

# Partitioning

> fdisk -l
- Lists disks
- Note your disk you want to install to
- IE `/dev/sda`

> fdisk \<disk\>

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
- 44
    - Changed type to 'Linux LVM'
    - There are no real downsides to using the LVM type
    - If the number has changed from `44`, figure out what it is now and use it

> p
- You see 'EFI System', 'Linux LVM'

> w

- Note your new partitions, as they are needed below
- IE `/dev/sda1`, `/dev/sda2`

**Also you may use `cfdisk`**
[Other Guide](networklessons.com/uncategorized/extend-lvm-partition)

---

> mkfs.fat -F32 \<disk_partition_1\>

---

> pvcreate --dataalignment 1m \<disk_partition_2\>

> vgcreate volgroup0 \<disk_partition_2\>

---

> lvcreate -L 24GB volgroup0 -n lv_root
- `pacman` will store packages here, you need some space
- You can purge /var/cache/pacman/pkg/ if you run out
- `pacman` gem installs a self-cleaning mechanism to help with this

> lvcreate -l 100%FREE volgroup0 -n lv_home

> modprobe dm_mod
- Load kernel module into kernel

> vgscan

> vgchange -ay

---

> mkfs.ext4 /dev/volgroup0/lv_root

> mount /dev/volgroup0/lv_root /mnt

> mkfs.ext4 /dev/volgroup0/lv_home

> mkdir /mnt/home

> mount /dev/volgroup0/lv_home /mnt/home

> mkdir /mnt/etc

> genfstab -U -p /mnt >> /mnt/etc/fstab

> cat /mnt/etc/fstab
- You see two entries: `/`, `/home`

# Gem

> gem
- Updates gem in case anything changed since the ISO was downloaded

> gem install /mnt
- Installs [gem](https://github.com/GeodeGames/gem) scripts into `/mnt/opt/gem`

# Pacstrap
> pacstrap -i /mnt base

# Base Packages
> arch-chroot /mnt

> pacman -S linux linux-headers

> pacman -S linux-lts linux-lts-headers
- Pick one of the above lines, or do both based on your desired stability
- Having multiple kernels can save you if something is incompatible with the newer one
- You can configure which one to boot
- *Accept the default package provider*

---

> pacman -S sudo

---

> pacman -S lvm2 helix
- `lvm2` is required regardless of partitioning setup type

> gem c init
- Find `HOOKS=`
- Add `lvm2` between `block` and `filesystems`
- Automatically rebuilds `linux` and / or `linux-lts` ramdisk environments when editor is closed

---

> helix /etc/locale.gen
- Find yours (en_US.UTF-8)

> locale-gen
- You should see it be generated

---

> useradd -m -g users -G wheel \<username\>
- -m makes a home
- -g is initial group
- wheel is a group for administrative commands

> passwd \<username\>

> EDITOR=helix visudo
- Uncomment the first "%wheel ALL=..." line
- Add `Defaults timestamp_timeout=60`
    - This makes a password only be required each hour for `sudo`

# GRUB

> pacman -S grub efibootmgr dosfstools os-prober mtools

> mkdir /boot/EFI

> mount \<disk_partition_1\> /boot/EFI

> grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck

> mkdir -p /boot/grub/locale
- It probably already exists, can check and see

> cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo

> gem c grub (Or `gem s config/grub` if you have no configuration changes)

---

> gem s base

> gem s net/core

> gem s net/wifi
- Optional

---

> exit

> umount -a
- Errors are normal here

> reboot
- Remove your installation medium

---

- Log into your user account

---

> gem s dev

---

# Pacman Configuration

> gem s config/pacman

---

> sudo su

---

# Timezone Configuration

> timedatectl list-timezones

> timedatectl set-timezone America/Denver

> systemctl enable systemd-timesyncd

# Hostname

> hostnamectl set-hostname \<hostname\>

> cat /etc/hostname

> helix /etc/hosts
- 127.0.0.1 localhost
- 127.0.0.1 \<hostname\>

> hostnamectl

# [Microcode](https://wiki.archlinux.org/title/microcode#:~:text=These%20updates%20provide%20bug%20fixes,updates%20to%20ensure%20system%20stability.)
- All arch users should install the right microcode for their processor, to ensure stability

> pacman -S amd-ucode

> pacman -S intel-ucode
- Pick one of the above lines

# Swap Partition (Not Strictly Necessary)
- Swap files can be altered without editing partition table

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

# Disable Root User Login

## Pick One

> passwd
- Set root user password

> passwd -l root
- Disable root user login

---

# Done

> exit
1. **Be sure not to install further gems under `sudo su`, as it causes problems**
1. Continue with [original instructions](https://github.com/GeodeGames/gem#installation)
