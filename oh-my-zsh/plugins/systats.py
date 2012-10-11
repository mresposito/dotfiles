#!/usr/bin/env python
# coding=UTF-8

import psutil 

charge =1
# Output
out = "" 
for st in psutil.cpu_percent(interval=1, percpu=True):
  out += "%11.0f | " % st
import sys

color_green = '%{[32m%}'
color_yellow = '%{[1;33m%}'
color_red = '%{[31m%}'
color_reset = '%{[00m%}'
color_out = (
    color_green if charge > .6
    else color_yellow if charge > .3
    else color_red
)

out = color_out + out + color_reset
sys.stdout.write(out)
