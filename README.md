# Raspberry PI setup

### Deps

`brew install ansible`

### Setup

1. Get disk number
  `diskutil list`
2. Unmount disk
  `diskutil unmountDisk /dev/disk<num>`
3. Format disk. You may need to unmount again afterwards.
  `diskutil eraseDisk FAT32 UNTITLED /dev/disk<num>`
4. Write image to disk
  `sudo dd bs=1m if=<image> of=/dev/rdisk<num>`
5. Connect to network
6. Define pi in hosts file
  `newpi ansible_host=<ip> ansible_ssh_pass=raspberry
  <new-ansible-hostname> ansible_host=<ip>`
7. Run setup ssh playbook. You can optionally supply a new hostname.
  `ansible-playbook -u pi -i hosts -l newpi --extra-vars="public_key=<public-key-file> hostname=<new-hostname>" setup-ssh.yml`
8. Run provision playbook against new ansible hostname, optionally setting a new user password for pi user.
  `ansible-playbook -u pi -i hosts -l <new-ansible-hostname> --extra-vars="password=<new-password>" provision.yml`
9. Run other desired ansible scripts on all hosts
  `ansible-playbook -i <host-file> <script>.yml`
  or limit to specific host `ansible-playbook -i <host-file> -l <host> <script>.yml`
