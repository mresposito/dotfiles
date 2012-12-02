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

UNWANTED = [ "setup.py", ".DS_Store" , ".gitignore", ".git", 'gomux',
              'shells', 'README.md', 'offlineimap.py' ]

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
  return os.listdir(Cmdline.curr_dir)

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


def removePrevious( file ):
  dst_dot =  os.path.join(Cmdline.dst_dir, "."+last(file) )
  # check if file exists
  if os.path.exists( dst_dot ):
    print "File %s already exists. Do you want to replace it? (y/n)" % dst_dot
    if ask_user( ):
      try:
        if os.path.isdir( dst_dot ) and not os.path.islink( dst_dot):
          shutil.rmtree( dst_dot)
        else:
          os.remove( dst_dot )
      except: 
          print "Failed to remove file :", last(file)
          return False
    else:
      return False
  return True

def linkFile( file  ):
  dst =  os.path.join(Cmdline.dst_dir,last(file)) 
  dst_dot =  os.path.join(Cmdline.dst_dir, "."+last(file) )
  try:
    os.symlink ( os.path.join(Cmdline.curr_dir, file), dst )
    os.rename( dst, dst_dot)
    print "Created link: ", dst_dot
  except OSError:
    print "Failed to link file :", last(file)

def setupGomux( ): # FIXME: need sudo permission
  go_mux = os.path.join( Cmdline.curr_dir, "gomux")
  shell_path = '/usr/local/bin'
  dst =   os.path.join(shell_path, "gomux") 
  if os.path.exists( dst ):
    return
  try:
    os.chdir( shell_path )
    cmd = 'sudo ln -s %s'% go_mux
    subprocess.call( cmd, shell=True )
    os.chdir( Cmdline.curr_dir )
  except: print "could not link gomux in", shell_path

# TODO implement backup files
def main():
  files = parseCmdline()
  if "gomux" in files:
    setupGomux()

  files = filter( lambda x: x not in UNWANTED, files)
  files = filter( removePrevious, files)
  # script to start tmux with default sessions.
  map( linkFile, files)
  
if __name__ == '__main__':
  main()
