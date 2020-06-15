#
# Base build:
# 
# setup-alpine ran
#
# Community apk respoitory enabled
#
# ipv6 disabled with
#
# /etc/sysctl.conf
#
# net.ipv6.conf.all.disable_ipv6 = 1
# net.ipv6.conf.default.disable_ipv6 = 1
# net.ipv6.conf.lo.disable_ipv6 = 1
#
#
echo "welcome to the install script"
#
echo "Change root password"
passwd
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
#
echo "Add standard packages"
#
echo "Install Hyper-V extensions"
#
apk add hvtools
#
# Then enable the services
#
rc-service hv_fcopy_daemon start
rc-service hv_kvp_daemon start
rc-service hv_vss_daemon start
#
# Then to ensure these services start on boot
#
rc-update add hv_fcopy_daemon
rc-update add hv_kvp_daemon
rc-update add hv_vss_daemon
#
wget https://raw.githubusercontent.com/DTidey/Alpine/master/install/setup-mgt.sh
chmod +x setup-mgt.sh
#
wget https://raw.githubusercontent.com/DTidey/Alpine/master/install/setup-gui.sh
chmod +x setup-gui.sh
#
echo "Now reboot and then run setup-mgt.sh and setup-gui.sh"
echo "Type 'reboot'"


