FROM debian:buster-slim
LABEL maintainer "opensource@opensourcery.uk"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get dist-upgrade -y \
 && apt-get install -y bind9 \
 && apt-get clean  \
 && rm -r /var/lib/apt/lists/*

ADD entrypoint.sh /entrypoint.sh

RUN chmod 755 /entrypoint.sh \
 && mkdir /entrypoint.d \
 && mkdir -p /run/named \
 && chown bind:bind /run/named \
 && chmod 0750 /run/bind

EXPOSE 53 53/udp

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/named", "-c", "/etc/bind/named.conf", "-u", "bind", "-g"]
