#!/bin/sh
latest=`cat latest`

apt-get -qq update
PACKAGES="freeswitch freeswitch-systemd libfreeswitch1 freeswitch-mod-sofia freeswitch-mod-console freeswitch-mod-commands freeswitch-mod-dptools freeswitch-mod-say-ru freeswitch-sounds-ru-ru-elena freeswitch-sounds-ru-ru-kirill freeswitch-sounds-ru-ru-vika freeswitch-mod-directory freeswitch-mod-opus freeswitch-mod-dialplan-xml freeswitch-mod-logfile freeswitch-mod-sndfile freeswitch-conf-minimal libsofia-sip-ua0 libspandsp3 libspeex1 libspeexdsp1 freeswitch-music-default freeswitch-mod-native-file freeswitch-mod-cdr-csv freeswitch-mod-loopback freeswitch-mod-esl freeswitch-mod-event-socket freeswitch-mod-local-stream freeswitch-timezones freeswitch-mod-lua freeswitch-mod-shout"
apt-get download $(apt-cache depends --no-recommends --no-suggests \
  --no-conflicts --no-breaks --no-replaces --no-enhances \
  --no-pre-depends ${PACKAGES} | grep "^\w")

RELEASE=$(echo freeswitch_*.deb)
version=$(echo "$RELEASE" | awk -F '_' '{ print $2 }')
echo "Most recent Freeswitch version $version"
echo "Comparing with version $latest"
if [ "$version" = "$latest" ]; then echo "EQUAL"; touch equal; else echo "NOT EQUAL";fi;