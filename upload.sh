#!/bin/sh

if [ -f equal ]; then
  echo "Equal game"
  exit 0;
fi

RELEASE=$(echo *.deb | tr ' ' ',')
deployer upload --distro bookworm public_apt "$RELEASE"