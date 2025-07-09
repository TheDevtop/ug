FROM alpine:3

WORKDIR /root
RUN mkdir -p /srv/repos && chmod -R a=rwX /srv/repos
RUN apk update && apk add openssh git && apk cache purge
RUN ssh-keygen -A && mkdir /root/.ssh && touch /root/.ssh/authorized_keys
VOLUME [ "/srv/repos" ]
EXPOSE 22
CMD [ "/usr/sbin/sshd", "-D"]
LABEL org.opencontainers.image.source "https://github.com/TheDevtop/ug"
