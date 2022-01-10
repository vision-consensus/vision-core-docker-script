FROM ubuntu:18.04
ARG VISION_VERSION

ENV DEBIAN_FRONTEND noninteractive
ENV SYSTEMD_PAGER less
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE DontWarn

RUN set -ex \
    && buildDeps="wget" \
    && runtime_pkgs="software-properties-common ca-certificates gpg-agent curl vim cron rsyslog logrotate procps iputils-ping iproute2 libgoogle-perftools4" \
    && systemd_pkgs="systemd libsystemd0 systemd-sysv dbus libpam-systemd less openjdk-8-jdk " \
    && apt-get update && apt-get install -y --no-install-recommends $buildDeps $runtime_pkgs $systemd_pkgs \
    && rm -rf /root/.cache \
    && rm -rf /var/lib/apt/lists/* /tmp/*

COPY ./ /opt/vision/
RUN wget -Y off -O /opt/vision/FullNode.jar https://github.com/vision-consensus/vision-core/archive/refs/tags/${VISION_VERSION}.jar
#RUN cp /opt/vision/vision.service /lib/systemd/system/
#RUN chmod 644 /lib/systemd/system/vision.service && systemctl enable vision.service

RUN chmod +x /opt/vision/start
WORKDIR /data/vision

#CMD ["/sbin/init"]
ENTRYPOINT ["/opt/vision/start"]
