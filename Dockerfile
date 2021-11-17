FROM debian:11-slim
MAINTAINER mailsvb <mailsvb@gmail.com>

RUN apt-get update --yes && apt-get upgrade --yes && \
    apt-get install --yes git pkg-config dpkg-dev debhelper-compat default-libmysqlclient-dev gperf libavcodec-dev libavfilter-dev libavformat-dev libavutil-dev libbcg729-dev \
                          libbencode-perl libcrypt-openssl-rsa-perl libcrypt-rijndael-perl libcurl4-openssl-dev libdigest-crc-perl libdigest-hmac-perl libevent-dev libglib2.0-dev \
                          libhiredis-dev libio-multiplex-perl libio-socket-inet6-perl libiptc-dev libjson-glib-dev libmosquitto-dev libnet-interface-perl libpcap0.8-dev libpcre3-dev \
                          libsocket6-perl libspandsp-dev libssl-dev libswresample-dev libsystemd-dev libwebsockets-dev libxmlrpc-core-c3-dev libxtables-dev markdown python3 \
                          python3-websockets zlib1g-dev && \
    git clone --depth=1 --branch=mr10.1.1.5 https://github.com/sipwise/rtpengine.git && \
    cd /rtpengine && dpkg-buildpackage && cd / && rm -Rf /rtpengine && \
    apt-get remove --yes git pkg-config dpkg-dev debhelper-compat default-libmysqlclient-dev gperf libavcodec-dev libavfilter-dev libavformat-dev libavutil-dev libbcg729-dev \
                         libbencode-perl libcrypt-openssl-rsa-perl libcrypt-rijndael-perl libcurl4-openssl-dev libdigest-crc-perl libdigest-hmac-perl libevent-dev libglib2.0-dev \
                         libhiredis-dev libio-multiplex-perl libio-socket-inet6-perl libiptc-dev libjson-glib-dev libmosquitto-dev libnet-interface-perl libpcap0.8-dev libpcre3-dev \
                         libsocket6-perl libspandsp-dev libssl-dev libswresample-dev libsystemd-dev libwebsockets-dev libxmlrpc-core-c3-dev libxtables-dev markdown python3 \
                         python3-websockets zlib1g-dev && \
    apt-get autoremove --yes && \
    apt-get install --yes libbencode-perl libconfig-tiny-perl libcrypt-rijndael-perl libdigest-hmac-perl libio-socket-inet6-perl libsocket6-perl netcat-openbsd libb-hooks-op-check-perl libexporter-tidy-perl \
                          iptables libavcodec58 libavformat58 libavutil56 libbcg729-0 libevent-2.1-7 libevent-pthreads-2.1-7 libhiredis0.14 libip4tc2 libip6tc2 libjson-glib-1.0-0 libmariadb3 libmosquitto1 \
                          libpcap0.8 libspandsp2 libswresample3 libwebsockets16 libxmlrpc-core-c3 dkms lsb-release && \
    apt-get clean --yes && \
    dpkg -i ngcp-rtpengine-daemon* ngcp-rtpengine-utils* ngcp-rtpengine-kernel-dkms* && \
    rm -f /ngcp*
