#!/bin/bash
if [ $# -gt 0 ]; then
  find $* -iname "*Stat*.json" -o -iname "in.*" -o -iname "bg.*" -o -iname "*.model" -o -iname "AppClassDetector" | xargs rm -f 
fi
