FROM archlinux

MAINTAINER jhx <jhx0x00@gmail.com>

ADD scripts/run.sh /usr/bin

ADD packages.list /packages.list

ADD scripts/setup.sh /setup.sh

ADD config/sshd_config /sshd_config
ADD config/pacman.conf /pacman.conf

RUN chmod +x /setup.sh && /setup.sh && rm /setup.sh

EXPOSE 5900
EXPOSE 22

USER archbox
WORKDIR /home/archbox

CMD ["run.sh"]
