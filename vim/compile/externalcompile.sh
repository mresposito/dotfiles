#!/bin/bash
OutFile=/tmp/make.out
OutDir=~/debug
InFile=AppClassDetector
InFile=SandboxTimeDist
InFile=SandboxImageOperations

Time=`date "+ date %Y-%m-%d  time %H-%M-%S"`
echo Compiling for $OutDir @ $Time >$OutFile
echo make -C $OutDir $InFile >>$OutFile
make -j 4 -C $OutDir $InFile 2>&1 | grep -v "In file included from" | grep -v "could not create compact unwind for" | grep -v "clang: warning: argument unused during compilation" >>$OutFile
Warnings=`grep -c "[0-9]: warning:" $OutFile`
Errors=`grep -c "[0-9]: error:" $OutFile`
Link=`grep -c "Undefined symbols:" $OutFile`

Cmd=vim
if [[ "Darwin" == `uname` ]]; then
  osascript ~/.vim/compile/CompilationDone.scpt `basename $OutDir` "$Time" $Warnings $Errors $Link
  Cmd=mvim 
fi
$Cmd --remote-send "<esc>:cfile $OutFile<CR>" --servername BOT2CODE

