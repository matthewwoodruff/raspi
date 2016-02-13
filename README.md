# Raspberry PI setup

1. Write image to card
2. Change password
3. Run `sudo raspi-config` and enable ssh
4. Change hostname `/etc/hostname`
5. Copy ssh key
6. Create ansible hosts file using `hosts.example` as a reference
7. Run desired ansible scripts on all hosts
  `ansible-playbook -i <host-file> <script>.yml`
  or limit to specific host `ansible-playbook -i <host-file> -l <host> <script>.yml`
