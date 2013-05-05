import sys, subprocess, os

args = sys.argv[1:-1]
for a in args:
  if not os.path.exists( a ):
    raise IOError( "file %s does not exist" %a)

src = "  ".join( args )
if len( sys.argv ) < 3:
  dst = '~'
else:
  dst = sys.argv[-1].replace('/Users/mre','~')

cmd="rsync -ravP -e ssh -y %s esposit5@remlnx.ews.illinois.edu:%s" % ( src, dst )
subprocess.call(cmd, shell=True)
