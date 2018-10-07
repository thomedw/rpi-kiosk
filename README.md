Chromium kiosk for Raspberry PI

This will run in raspbian lite without X server.

Example:

```docker run -v /dev/tty0:/dev/tty0 --name rpi-kiosk -e URL=http://material.angular.io --privileged --rm thomaskatalis/rpi-kiosk```
