FROM debian:stable-slim
MAINTAINER Jean-Avit Promis "docker@katagena.com"

RUN apt-get update && \
	DEBIAN_FRONTEND=noninteractive apt-get -yq install rsync wget openssh-client cron procps && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
	sed -i "s/RSYNC_ENABLE=false/RSYNC_ENABLE=true/" /etc/default/rsync

ADD rsyncd.conf /etc/rsyncd.conf
ADD rsyncd.secrets /etc/rsyncd.secrets

ADD start.sh /start.sh
RUN chmod +x /start.sh

ADD sync.sh /sync.sh
RUN chmod +x /sync.sh

ADD init.sh /init.sh
RUN chmod +x /init.sh

RUN mkdir /root/ssh/

VOLUME /datas /sync
EXPOSE 873

CMD /start.sh
