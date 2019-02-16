FROM ubuntu:16.04
MAINTAINER Sylvain <stherien@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV USER ubuntu
ENV HOME /home/$USER

# Create new user for vnc login.
RUN adduser $USER --disabled-password

# Install Ubuntu Unity.
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ubuntu-desktop \
        unity-lens-applications \
        gnome-panel \
        metacity \
        nautilus \
        gedit \
        xterm \
        putty \
        sudo

# Install dependency components.
RUN apt-get install -y \
        supervisor \
        net-tools \
        curl \
        git \
        pwgen \
        libtasn1-3-bin \
        libglu1-mesa

# Add various tools
RUN add-apt-repository ppa:webupd8team/atom \
    && apt-get update \ 
    && apt-get install -y \
        atom \
        libxss1 \
        terminator \
        vim \
        wget

# Copy Opera repository for apt-get
COPY opera.list /etc/apt/sources.list.d/

# Add Firefox and Opera
RUN wget -O - http://deb.opera.com/archive.key | apt-key add - \
    && apt-get update \
    && apt-get install -y \
        firefox \
        opera-stable

# Add Network-Automation Application part 1
RUN apt-get update \
    && apt-get install -y \
        build-essential \
        libssl-dev libffi-dev \
        python-pip

# Add Network-Automation Application part 1
RUN pip install  \
        cryptography

# Add Network-Automation Application part 2
RUN pip install --upgrade pip

# Add Network-Automation Application part 3
RUN pip install  \
        paramiko \
        netmiko \
        napalm \
        ansible \        
    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

# Copy startup script
COPY startup.sh $HOME

# Copy Unity background
COPY myfirefox.desktop $HOME/.local/share/applications/

# Copy Unity background
COPY AUDG.png $HOME

CMD ["/bin/bash", "/home/ubuntu/startup.sh"]
