FROM ubuntu:20.04
RUN apt update
RUN apt install software-properties-common
RUN add-apt-repository ppa:ubuntukylin-members/ukui
RUN apt update
RUN export DEBIAN_FRONTEND=noninteractive && apt install xz-utils dbus-x11 x11-xserver-utils xorg gnome-system-monitor mate-system-monitor git ukui-desktop-environment xfce4-goodies xfce4-terminal tightvncserver curl wget -y
RUN wget https://github.com/novnc/noVNC/archive/refs/tags/v1.2.0.tar.gz
RUN tar -xvf v1.2.0.tar.gz
RUN mkdir  $HOME/.vnc
RUN echo '114514' | vncpasswd -f > $HOME/.vnc/passwd
RUN chmod 600 $HOME/.vnc/passwd
RUN echo 'whoami ' >>/luo.sh
RUN echo 'cd ' >>/luo.sh
RUN echo "su -l -c  'vncserver :2000 -geometry 1280x800' "  >>/luo.sh
RUN echo 'cd /noVNC-1.2.0' >>/luo.sh
RUN echo './utils/launch.sh  --vnc localhost:7900 --listen 8900 ' >>/luo.sh
RUN chmod 755 /luo.sh
EXPOSE 8900
CMD  /luo.sh
