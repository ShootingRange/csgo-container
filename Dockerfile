FROM ubuntu:18.04

RUN dpkg --add-architecture i386 && \
	apt-get update -y && \
	apt-get -y install wget libcurl3:i386 libsdl2-2.0-0:i386

RUN mkdir /usr/src/steamcmd /usr/src/csgo
WORKDIR /usr/src
RUN wget "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" && \
	tar -xf steamcmd_linux.tar.gz -C ./steamcmd && \
	rm steamcmd_linux.tar.gz

# Fixes server complaining about failing to load steamclient.so
RUN mkdir -p /root/.steam/sdk32 && ln -s /usr/src/steamcmd/linux32/steamclient.so /root/.steam/sdk32/steamclient.so

COPY entrypoint.sh install-csgo.sh update-csgo.sh ./
RUN chmod a+rwx entrypoint.sh install-csgo.sh update-csgo.sh

ENTRYPOINT ["/usr/src/entrypoint.sh"]
