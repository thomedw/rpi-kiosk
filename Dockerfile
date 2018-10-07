FROM thomaskatalis/rpi-raspbian:stretch

RUN [ "cross-build-start" ]

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

RUN apt-get install -y chromium-browser
#RUN apt-get install -y dropbear
RUN apt-get install -y xserver-xorg-core
RUN apt-get install -y xserver-xorg-video-fbdev
RUN apt-get install -y x11-xserver-utils
RUN apt-get install -y libgl1-mesa-dri
##RUN apt-get install -y xserver-xorg-video-vesa  xorg-video-abi-18
RUN apt-get install -y matchbox-window-manager
RUN apt-get install -y xautomation
RUN apt-get install -y feh
RUN apt-get install -y xauth
RUN apt-get install -y libraspberrypi0 libraspberrypi-dev libraspberrypi-doc libraspberrypi-bin
RUN apt-get install -y xinit

#RUN apt-get clean && rm -rf /var/lib/apt/lists/*

#RUN apt-get update && apt-get install -y \
#  iceweasel dropbear xserver-xorg-core xserver-xorg-video-fbdev x11-xserver-utils \
#  libgl1-mesa-dri xserver-xorg-video-modesetting xserver-xorg-video-vesa \
#  matchbox-window-manager openvpn xautomation feh \
#  && apt-get clean && rm -rf /var/lib/apt/lists/*

ADD run /bin/run
ADD wallpaper.png /etc/wallpaper.png
#ADD dot-mozilla /root/.mozilla
#RUN chmod +x /bin/run
#VOLUME /dev/tty0

RUN adduser --system --uid 5000 --disabled-password --shell /bin/bash  -q chromium
RUN addgroup chromium tty
RUN [ "cross-build-end" ]

ADD start-chromium /root/start-chromium

#USER chromium

ENV XINITRC=/root/start-chromium
ENTRYPOINT [ "/bin/run" ]

