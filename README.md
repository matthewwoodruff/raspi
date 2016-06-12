# Raspberry PI setup

### Deps

`brew install ansible`

### Setup

1. Format disk and write image.
  `./setup.sh <image>`
2. Connect to network
3. Define pi in hosts file
  `newpi ansible_host=<ip> ansible_ssh_pass=raspberry
  <new-ansible-hostname> ansible_host=<ip>`
4. Run setup ssh playbook. You can optionally supply a new hostname.
  `ansible-playbook -u pi -i hosts -l newpi --extra-vars="public_key=<public-key-file> hostname=<new-hostname>" setup-ssh.yml`
5. Run provision playbook against new ansible hostname, optionally setting a new user password for pi user.
  `ansible-playbook -i hosts -l <new-ansible-hostname> --extra-vars="password=<new-password>" provision.yml`
6. Run other desired ansible scripts on all hosts
  `ansible-playbook -i <host-file> <script>.yml`
  or limit to specific host `ansible-playbook -i <host-file> -l <host> <script>.yml`
