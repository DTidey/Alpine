#
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
#
echo "Now reboot and then run setup-mgt.sh and setup-gui.sh"
echo "Type 'reboot'"


