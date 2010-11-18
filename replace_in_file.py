import sys
import os
import fnmatch
import os.path
import re

#find recursively all tex files
rootdir = os.path.abspath(sys.argv[1])
replacefn = os.path.abspath(sys.argv[2])
if not os.path.isdir(rootdir) or not os.path.isfile(replacefn):
  print "Usage: python replace_in_files.py <ROOTDIR> <FILE_CONTAINING_OLD_NEW_STRING"
  sys.exit(1)
print "Finding tex files ..."

texfilenames = []
for root, dirnames, filenames in os.walk(rootdir):
  for filename in fnmatch.filter(filenames, '*.tex') :
    texfilenames.append(os.path.join(root, filename))

print "Building substitutions ..."
#build list of reg
regs = []
replacefile = open(replacefn,'r')
print replacefn
for line in replacefile:
  print "New line ..."
  print line
  split = line.split()
  print split
  #skip errorenous entries 
  if len(split) is not 2 :
    continue
  old,new = split[0],split[1]
  #build non greedy regexp
  pattern = r'(\\cite[a-z]?{\w*?)' + old 
  regexp = re.compile(pattern)
  regs.append( (regexp,new) ) 

print "Replacing text in files ..."

#Circle through the list of files and replace all
for fn in texfilenames:
  file = open(fn,'r')
  content = file.read()
  new_content = content
  file.close()
  num_all_subs = 0
  for  regexp in regs:
    new_content, num_of_subs = regexp[0].subn(r'\1'+ regexp[1],new_content)
    num_all_subs += num_of_subs
  #Only write if there was any substitutions
  if num_all_subs > 0 :
    #Backup
    file_bak = open(fn + ".bak",'w')
    file_bak.write(content)
    file_bak.close()
    #Write new string
    print "Pattern found in %s" % fn
    file = open(fn,'w')
    file.write(new_content)
    file.close()
