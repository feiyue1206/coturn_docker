FROM ubuntu:16.04

LABEL maintainer = "victor <songjian@rockrobo.com>"

WORKDIR /rrcoturn

ADD run_coturn.sh /rrcoturn/

#TURN port
EXPOSE 3478 3479 

#cli port  
EXPOSE 5766

ENV MIN_PORT=9100
ENV MAX_PORT=9999

RUN apt-get update && apt-get install -y \
    dnsutils \
    telnet \
    curl \
    git gcc g++ vim\
    build-essential \
    libssl-dev \
    libevent-dev \
    sqlite3 libsqlite3-dev libboost-dev \
    emacs-nox libpq-dev mysql-client libmysqlclient-dev libhiredis-dev \
    #coturn \
    && rm -rf /var/lib/apt/lists/* \
    #build coturn from src
    && curl -fL -o /rrcoturn/coturn.tar.gz \
         https://github.com/coturn/coturn/archive/4.5.1.1.tar.gz \
    && tar -xzf /rrcoturn/coturn.tar.gz -C /rrcoturn/ \
    && cd /rrcoturn/coturn-* \
    && ./configure --prefix=/usr \
        --turndbdir=/var/lib/coturn \
        --disable-rpath \
        --sysconfdir=/etc/coturn \
        --mandir=/rrcoturn/man \
        --docsdir=/rrcoturn/docs \
        --examplesdir=/rrcoturn/examples \
    && make \ 
    #can also run directly from bin
    && make install \ 
    && mkdir -p /rrcoturn/logs/ \
    && chmod a+x /rrcoturn/run_coturn.sh \
    && cd /rrcoturn
  
WORKDIR /rrcoturn

#CMD ["/bin/bash"] 
ENTRYPOINT ["bash", "run_coturn.sh"]
