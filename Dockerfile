FROM ubuntu:18.04

ARG DYNOMITE_VERSION=v0.7.0

# Update the repository sources list and Install package Build Essential
RUN apt-get update && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get install -y \
    autoconf \
    build-essential \
    dh-autoreconf \
    git \
    libssl-dev \
    libtool \
    software-properties-common \
    redis-server \
    tcl8.5 

WORKDIR /tmp
RUN git clone https://github.com/Netflix/dynomite.git
WORKDIR /tmp/dynomite
RUN git checkout tags/$DYNOMITE_VERSION

RUN autoreconf -fvi \
    && ./configure --enable-debug=log \
    && CFLAGS="-ggdb3 -O0" ./configure --enable-debug=full \
    && make \
    && make install

ADD /dynomite.yml /app/
ADD /redis.conf /app/

RUN mkdir -p /app \
    && cp src/dynomite /app \
    && rm -rf /tmp/dynomite

#peer port
EXPOSE 8101
#redis port
EXPOSE 22122
#stats/admin port
EXPOSE 22222
#dynomite
EXPOSE 8102

ADD /startup.sh /app/startup.sh

VOLUME /var/lib/redis

CMD ["/app/startup.sh"]
