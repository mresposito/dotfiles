#!/bin/sh

if [ "$1" = "bot" ]
#if [ "`networksetup -getairportnetwork Airport`" = "Current AirPort Network: BotSquare" ]
then
  echo "@BotSquare"
  sed -i.bak 's/#*10.1.10/10.1.10/g' /etc/hosts
else
  echo "@Somewhere Else"
  sed -i.bak 's/#*10.1.10/#10.1.10/g' /etc/hosts
fi
