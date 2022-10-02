<div align="center">

# 42cursus: born2beroot
### 🔥System Administration🔥
</div>

> This project aims to introduce you to the wonderful world of virtualization.
You will create your first machine in VirtualBox under specific instructions. Then, at the end of this project, you will be able to set up
your own operating system while implementing strict rules.

---

### ♦️ . Setting up the environment

####  Download Virtualbox
- <a href="https://www.virtualbox.org/wiki/Downloads">Link to</a>

####  Download Debian
- <a href="https://www.debian.org/distrib/">Link to</a>

---

### ♦️ . Mandatory part

#### Create partitions using LVM
- Identity Disk and Create Physical Volume (PV)
```
    $ sudo fdisk -l
    $ sudo pvcreate  <disk1> <disk2>
```
- Create Volume Group (VG)
```
    $ sudo vgcreate <vg_name> <pv>
```
- Create Logical volume (LV) from Volume Group (VG)
```
    $ sudo lvcreate -L <Size> -n <lv_name> <vg_name>
```
- Format LVM partition
```
    $ sudo mkfs.ext4 <LV_Path>
```
- Create a mount point
```
    $ sudo mkdir /data
    $ sudo mount /dev/<vg_name>/<lv_name> /data
```

#### Installing SSH and configuring SSH service
```
    $ sudo apt install openssh-server
```

- Changing default port (22) to 4242 (Edit the file, change the line Port22 to Port 4242)
```
    $ sudo nano /etc/ssh/sshd_config
```

#### Installing and configuring UFW
- Install UFW
```
    $ sudo apt install ufw
```

- Enable
```
    $ sudo ufw enable
```

- Configure the rules
```
    $ sudo ufw allow ssh
```

- Configure the port rules
```
    $ sudo ufw allow 4242
```
