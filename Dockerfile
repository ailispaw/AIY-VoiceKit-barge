FROM resin/raspberrypi3-debian:stretch

RUN adduser --gecos ",,," --disabled-password pi \
 && echo "pi ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/pi

USER pi:pi
WORKDIR /home/pi

RUN sudo apt-get -q update \
 && sudo apt-get -q -y install --no-install-recommends git \
    \
 && git clone https://github.com/google/aiyprojects-raspbian.git AIY-projects-python \
 && cd AIY-projects-python \
 && git checkout -B voicekit -t origin/voicekit \
 && ./scripts/install-deps.sh \
 && sudo ./scripts/install-alsa-config.sh \
    \
 && sudo rm -rf /var/lib/apt/lists/* /var/cache/apt/* /var/cache/debconf/* /var/log/*

RUN mkdir bin \
 && sed -i -e 's/#\(force_color_prompt=yes\)/\1/' .bashrc

COPY AIY-projects-shell.sh bin/

CMD [ "bin/AIY-projects-shell.sh" ]
