
#
# Upgrade any packages
#
apk upgrade
#
setup-xorg-base xfce4 xfce4-terminal lightdm-gtk-greeter xfce4-screensaver dbus-x11
#
apk add xf86-video-fbdev
apk add xf86-input-mouse xf86-input-keyboard
apk add faenza-icon-theme
apk add polkit consolekit2
apk add --no-cache ca-certificates curl openssl xvfb x11vnc 
#
rc-service dbus start
rc-update add dbus
#
rc-service lightdm start
rc-update add lightdm
#
rc-update add local default
cat > /etc/local.d/vnc.start << EOF
#!/bin/ash
nohup x11vnc -xkb -noxrecord -noxfixes -noxdamage -display :0 -loop -shared -forever -bg -auth /var/run/lightdm/root/:0 -rfbport 5900 -o /var/log/vnc.log > /dev/null 2>&1 &
EOF
chmod +x /etc/local.d/vnc.start
#
# Set a suitable resolution using GRUB
#
# add video=hyperv_fb:1280x720
# to end of GRUB_CMDLINE_LINUX_DEFAULT
# in /etc/default/grub
#
sed -i '/GRUB_CMDLINE_LINUX_DEFAULT/ s/"$/ video=hyperv_fb:1280x720"/' /etc/default/grub
#
# Regenerate GRUB configuration file
#
grub-mkconfig -o /boot/grub/grub.cfg
#
# Install Chrome
#
apk add chromium
#
echo "Done..."
reboot


