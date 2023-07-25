FROM debian:10
RUN apt-get update 
RUN apt-get install gawk wget git diffstat unzip texinfo gcc \
    build-essential chrpath socat cpio python3 python3-pip python3-pexpect \
    xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa \
    libsdl1.2-dev pylint3 xterm python3-subunit mesa-common-dev zstd liblz4-tool \
    locales nano -y 
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen
RUN git clone https://git.yoctoproject.org/poky -b kirkstone && cd poky && source oe-init-build-env
RUN touch conf/sanity.conf
CMD ["/bin/bash"]