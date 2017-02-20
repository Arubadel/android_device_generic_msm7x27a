#!/system/bin/sh
logwrapper bccmd -b 115200 -t bcsp -d /dev/ttyHS0 psload -r /system/etc/PSConfig_7820.psr
exec logwrapper hciattach -n -p /dev/ttyHS0 bcsp 3000000 flow
