#!/usr/bin/env python
# coding=UTF-8

import math, subprocess

p = subprocess.Popen(["ioreg", "-rc", "AppleSmartBattery"], stdout=subprocess.PIPE)
output = p.communicate()[0]

o_max = [l for l in output.splitlines() if 'MaxCapacity' in l][0]
o_cur = [l for l in output.splitlines() if 'CurrentCapacity' in l][0]
o_char= [l for l in output.splitlines() if 'ExternalConnected' in l][0]
  
b_max = float(o_max.rpartition('=')[-1].strip())
b_cur = float(o_cur.rpartition('=')[-1].strip())
b_char= bool(o_cur.rpartition('=')[-1].strip())
b_char=False

charge = b_cur / b_max
charge_threshold = int(math.ceil(10 * charge))

# Output

out = "%10.3f" % charge
if b_char:
  out += u'⚡'
import sys

color_green = '%{[32m%}'
color_yellow = '%{[1;33m%}'
color_red = '%{[31m%}'
color_reset = '%{[00m%}'
color_out = (
    color_green if (charge > .6 or b_char )
    else color_yellow if charge > .3
    else color_red
)

out = color_out + out.encode('utf-8') + color_reset
sys.stdout.write(out)
