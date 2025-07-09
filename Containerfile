FROM alpine:3

WORKDIR /root
RUN apk update && apk add openssh git && apk cache purge
RUN mkdir -p /srv/repos && chmod -R a=rwX /srv/repos
RUN ssh-keygen -A && mkdir /root/.ssh && touch /root/.ssh/authorized_keys && chmod 644 /root/.ssh/authorized_keys
COPY ./sshd_config /etc/ssh/sshd_config
VOLUME [ "/srv/repos" ]
EXPOSE 22
CMD [ "/usr/sbin/sshd", "-De"]
LABEL org.opencontainers.image.source "https://github.com/TheDevtop/ug"
