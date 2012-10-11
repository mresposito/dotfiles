#!/usr/bin/env python
# coding: utf-8

###      @file:  setup.py
###
###     @brief:  setup link to dot files
###    @detail:  2012-10-04
###      @date:
###    @author:  Michele Esposito

import os, sys, os.path, glob, shutil, optparse, subprocess

last =  lambda x:os.path.split(x)[1]
class Cmdline:
  pass

def parseCmdline():
  usage = \
  """
  Usage: %prog [options]
  """
  parser = optparse.OptionParser( usage)
  group  = optparse.OptionGroup ( parser, "Options")

  group.add_option("-v", "--verbose", type="int", default=0, help="Verbosity", dest="verbose")
  group.add_option("-d", "--directory", type="string", default="~", help="directory to parse", dest="dst_dir")
  parser.add_option("-f", "--force", action="store_true", dest="force", default=False,help="do not ask user permission")


  # TODO implement backup
  parser.add_option_group( group)
  Cmdline.options, Cmdline.args = parser.parse_args()

  if Cmdline.options.dst_dir == '~':
    Cmdline.dst_dir = os.path.expanduser('~')
  else:
    Cmdline.dst_dir = os.path.abspath( Cmdline.options.dst_dir )

  if not os.path.isdir( Cmdline.dst_dir ):
    os.path.makedirs( Cmdline.dst_dir )

  Cmdline.curr_dir = os.path.dirname(os.path.abspath(__file__))
  Cmdline.files = os.listdir(Cmdline.curr_dir)
  if Cmdline.options.verbose > 0:
    print Cmdline.files
  pass

def ask_user( ):
  if Cmdline.options.force:
    return True
  answer = raw_input()
  if answer == 'y':
    return True
  if answer == 'n':
    return False
  print "Please type either (y/n)"
  ask_user( )
  pass

def checkDestination():
  files = Cmdline.files

  # remove unwanted files
  files.remove( "setup.py" ) 
  try: files.remove( ".DS_Store" ) 
  except: pass

  for file in files:
    dst_dot =  os.path.join(Cmdline.dst_dir, "."+last(file) )
    # check if file exists
    if os.path.exists( dst_dot ):
      print "File %s already exists. Do you want to replace it? (y/n)" % dst_dot
      if ask_user( ):
        try: os.remove( dst_dot)
        except: 
          print "Failed to remove file :", last(file)
          files.remove( file )
      else:
        files.remove( file )

def linkFiles():
  for file in Cmdline.files:
    dst =  os.path.join(Cmdline.dst_dir,last(file)) 
    dst_dot =  os.path.join(Cmdline.dst_dir, "."+last(file) )
    try:
      os.symlink ( os.path.join(Cmdline.curr_dir, file), dst )
      os.rename( dst, dst_dot)
      print "Created link: ", dst_dot
    except OSError:
      print "Failed to link file :", last(file)

def setupGomux( ):
  go_mux = os.path.join( Cmdline.curr_dir, "gomux")
  shell_path = '/usr/local/bin'
  dst =   os.path.join(shell_path, "gomux") 
  print go_mux
  print shell_path
  if os.path.exists( dst ):
    return
  try: os.symlink( go_mux , dst )
  except: print "could not link gomux in", shell_path
  Cmdline.files.remove("gomux")

# TODO implement backup files
def main():
  parseCmdline()
  if "gomux" in Cmdline.files:
    setupGomux()
  checkDestination()
  # script to start tmux with default sessions.
  linkFiles()
  pass
  
if __name__ == '__main__':
  main()
