#!/usr/bin/env bash

apt-get update
apt-get install -y mspdebug

# cleanup
apt-get -y autoremove
