#!/usr/bin/python
import os
def extract(cmds, filename):
    if not os.path.exists(filename):
        return
    
    with open(filename) as f:
        for line in f:
            if line in cmds:
                cmds.remove(line)
                cmds.append(line)
            else:
                cmds.append(line)

cmds = []
extract(cmds, os.getenv('HOME') + '/.bash_history.all')
extract(cmds, os.getenv('HOME') + '/.bash_history')
print "total commands: %s" % len(cmds)

with open(os.getenv('HOME') + '/.bash_history.all', 'w') as f:
    for line in cmds:
        f.write(line)
