#!/bin/sh

if [ -f equal ]; then
  echo "Equal game"
  exit 0;
fi

RELEASE=$(echo *.deb | tr ' ' ',')
deployer upload --distro "$(lsb_release -cs)" public_apt "$RELEASE"