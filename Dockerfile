FROM ubuntu:24.04

# default screen size
ENV XRES=1024x768x24

# default tzdata
ENV TZ=Etc/UTC

ENV DE=xfce

# update and install software
RUN export DEBIAN_FRONTEND=noninteractive  \
	&& apt-get update -q \
#	&& apt-get upgrade -qy \
	&& apt-get install -qy  --no-install-recommends \
	apt-utils sudo supervisor vim openssh-server rsync dialog htop zsh psmisc ack \
	xserver-xorg xvfb x11vnc dbus-x11 \
	xfce4 xfce4-terminal mint-y-icons \
	mousepad openbox obconf plank \
	mate-desktop-environment \
	systemsettings kde-plasma-desktop kwin-x11 plasma-discover \
	\
	# fix "LC_ALL: cannot change locale (en_US.UTF-8)""
	locales \
	&& echo "LC_ALL=en_US.UTF-8" >> /etc/environment \
	&& echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
	&& echo "LANG=en_US.UTF-8" > /etc/locale.conf \
	&& locale-gen en_US.UTF-8 \
	\
	# keep it slim
	# 	&& apt-get remove -qy \
	\
	# cleanup and fix
	&& apt-get autoremove -y \
	&& apt-get --fix-broken install \
	&& apt-get clean 
#	&& rm -rf /var/lib/apt/lists/*

# required preexisting dirs
RUN mkdir -p /run/sshd

# users and groups
RUN echo "root:ubuntu" | /usr/sbin/chpasswd \
    && (id -u ubuntu >/dev/null || useradd -m ubuntu -s /usr/bin/zsh) \
    && echo "ubuntu:m" | /usr/sbin/chpasswd \
    && echo "ubuntu    ALL=(ALL) ALL" >> /etc/sudoers 

RUN sudo chsh -s /usr/bin/zsh ubuntu

# add my sys config files
ADD etc /etc

# add bin
ADD home/bin/ /home/ubuntu/bin

# user config files
ADD home/.config /home/ubuntu/.config
ADD home/.local /home/ubuntu/.local
ADD home/.zshrc /home/ubuntu/.zshrc
ADD home/.vimrc /home/ubuntu/.vimrc
ADD home/.Xmodmap /home/ubuntu/.Xmodmap

#ADD home/.* /home/ubuntu/

	
# set owner
RUN chown -R ubuntu:ubuntu /home/ubuntu/.*

# ports
EXPOSE 22 5900

# # default command
CMD ["/usr/bin/supervisord","-c","/etc/supervisord.conf"]
