#!/bin/sh

unamestr=`uname`
ctagbin=ctags
cscopebin=cscope
if [ $unamestr = "Darwin" ]; then
  ctagbin=/usr/local/bin/ctags 
  cscopebin=/usr/local/bin/cscope 
fi

dir=.
if [ -d "code" ]; then
  dir=code
fi
find $dir -iname '*.c' -o -iname '*.h' -o -iname '*.cpp' -o -iname '*.cxx' -o -iname '*.cc' -o -iname '*.hh' -o -iname '*.m' -o -iname '*.mm' > /tmp/cscope.files

$cscopebin -b -i /tmp/cscope.files

$ctagbin -R -h .h.hh.hpp --langmap=c:.c.x,c++:+.hh.hpp.h.cpp.cc.cxx.tcc:objc:+.m.mm --c++-kinds=+p --fields=+aimnS --extra=+fq .

#$ctagbin -R -h .h.hh.hpp --langmap=c:.c.x,c++:+.hh.hpp.h.cpp.cc.cxx.tcc:objc:+.m.mm --c++-kinds=+p --fields=+aimnS --extra=+fq -L /tmp/cscope.files .
#gtags -f /tmp/cscope.files
#/opt/local/bin/mkid --include="C C++" 
