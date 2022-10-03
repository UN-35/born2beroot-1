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

#### Set password policy
- Password expiration, Min number of days allowed before the modification & Notification before expiration at least 7 days before.
  - Open login.defs file
    ```
        $ sudo nano /etc/login.defs
    ```
  - Find this part & edit it like this
    ```
        PASS_MAX_DAYS 30
        PASS_MIN_DAYS 2
        PASS_WARN_AGE 7
    ```
- Characters long, Contain (uppercase, lowercase letter, and a number), Not contain more than 3 consecutive identical characters.
    - Open the file
    ```
        $ sudo nano /etc/pam.d/common-password
    ```
    - Find the following line
    ```
        password [success=1 default=ignore] pam_unix.so obscure sha512
    ```
    - And add an extra word: minlen=10 at the end
    ```
        password [success=2 default=ignore] pam_unix.so obscure sha512 minlen=10
    ```
    - Find this line
    ```
        password    requisite   pam_pwquality.so retry=3
    ```
    - Add these values
    ```
        lcredit =-1 ucredit=-1 dcredit=-1 maxrepeat=3 usercheck=0 difok=7 enforce_for_root
    ```
