FROM linuxserver/calibre-web
MAINTAINER Yann yann_baviere@yahoo.fr
LABEL description="Calibre-web + Calibre (pour conversion des livres)"
ENV \
  LD_LIBRARY_PATH=/opt/calibre/lib \
  PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/calibre/bin
RUN \
 apt-get update && \
 DEBIAN_FRONTEND=noninteractive && \
 PYTHONIOENCODING="utf-8" && \
 apt-get install --no-install-recommends -y calibre && \
 apt-get -y autoremove && \
 apt-get clean && \
 apt-get purge && \
 rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
EXPOSE 8083
VOLUME /books /config
