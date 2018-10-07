Chromium kiosk for Raspberry PI

This will run in raspbian lite without X server.

Example:

```docker run -v /dev/tty0:/dev/tty0 --name rpi-kiosk -e URL=http://akveo.com/ngx-admin/#/pages/dashboard --privileged --rm thomaskatalis/rpi-kiosk```
