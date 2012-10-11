#!/usr/bin/env python
# coding=UTF-8

import subprocess, sys

try:
  p = subprocess.Popen(["ioreg", "-rc", "AppleSmartBattery"], stdout=subprocess.PIPE)
except:
  sys.exit()

output = p.communicate()[0]

o_max = [l for l in output.splitlines() if 'MaxCapacity' in l][0]
o_cur = [l for l in output.splitlines() if 'CurrentCapacity' in l][0]
o_char= [l for l in output.splitlines() if 'ExternalConnected' in l][0]
  
b_max = float(o_max.rpartition('=')[-1].strip())
b_cur = float(o_cur.rpartition('=')[-1].strip())
b_char= o_char.rpartition('=')[-1].strip()

charge = b_cur / b_max 

# Output

out = "%10.2f" % (charge *100)

color_green = '%{[32m%}'
color_yellow = '%{[1;33m%}'
color_red = '%{[31m%}'
color_reset = '%{[00m%}'
color_out = (
    color_green if (charge > .6 or b_char =="Yes" )
    else color_yellow if charge > .25
    else color_red
)
out = color_out + out + color_reset
if b_char =="Yes":
  out += u'⚡ '
sys.stdout.write(out.encode('utf-8'))
