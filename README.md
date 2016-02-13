# Raspberry PI setup

### Deps

`brew install ansible`
`pip install passlib`

### Setup

1. Get disk number
  `diskutil list`
2. Unmount disk
  `diskutil unmountDisk /dev/disk<num>`
3. Write image to disk
  `sudo dd bs=1m if=<image> of=/dev/rdisk<num>`
4. Connect to network
5. Define pi in hosts file
  `newpi ansible_host=<ip> ansible_ssh_pass=raspberry`
6. Create new password
  `python -c 'import crypt; print crypt.crypt("This is my Password", "$1$SomeSalt$")'`
7. Run initial provision script
  `ansible-playbook -u pi -i hosts -l newpi --extra-vars="public_key=<public-key-file> hostname=<new-hostname> password=<new-password>" playbook.yml`
8. Create ansible hosts file using `hosts.example` as a reference
9. Run desired ansible scripts on all hosts
  `ansible-playbook -i <host-file> <script>.yml`
  or limit to specific host `ansible-playbook -i <host-file> -l <host> <script>.yml`
