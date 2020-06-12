echo "welcome to the install script"
#
echo "Change root password"
passwd
#
echo "Update package list"
#
apk update
#
echo "Add new user"
#
adduser david
for u in $(ls /home); do for g in wheel disk lp floppy audio cdrom dialout video netdev games users; do addgroup $u $g; done;done
#
echo "Install Sudo"
#
apk add sudo
#
echo "david ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
#
Echo "Change MOTD"
echo "Welecome to Alpine Linux" > /etc/motd
#

