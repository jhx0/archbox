FROM archlinux:base

LABEL maintainer="jhx <jhx0x00@gmail.com>"

ADD scripts/run.sh /usr/bin

ADD packages.list /packages.list

ADD scripts/setup.sh /setup.sh

ADD config/sshd_config /sshd_config
ADD config/pacman.conf /pacman.conf

RUN chmod +x /setup.sh && \
    /setup.sh && \
    rm /setup.sh && \
    wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.5/dumb-init_1.2.5_x86_64 && \
    chmod +x /usr/local/bin/dumb-init

EXPOSE 5900
EXPOSE 22

USER archbox
WORKDIR /home/archbox

ENTRYPOINT ["/usr/local/bin/dumb-init", "--"]

CMD ["run.sh"]
