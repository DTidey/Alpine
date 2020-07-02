#
#
echo "welcome to the install script"
#
echo "Update package list"
#
apk update
#
echo "Install bash"
apk add bash
#
echo "Add new user"
#
adduser --shell /bin/bash david
for u in $(ls /home); do for g in wheel disk lp floppy audio cdrom dialout video netdev games users; do addgroup $u $g; done;done
#
echo "Install Sudo"
apk add sudo
#
echo '%wheel ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/wheel
#
echo "Change MOTD"
echo "Welecome to Alpine Linux" > /etc/motd
#
#
