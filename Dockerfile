FROM debian:buster
LABEL maintainer = "bartosz.grzeisak@gmail.com"

RUN apt update
RUN apt install -y git autoconf build-essential libboost-dev libboost-date-time-dev libboost-thread-dev zlib1g-dev libpng-dev libjpeg-dev libtiff5-dev libopenexr-dev
RUN apt autoclean
WORKDIR "/root"
RUN git clone https://github.com/wendrowycz/povray.git
RUN cd /root/povray/unix
RUN /root/povray/unix/prebuild.sh
RUN cd /root/povray/
RUN /root/povray/configure COMPILED_BY="Bartosz Grzesiak <bartosz.grzesiak@gmail.com>"
RUN make
RUN make install
