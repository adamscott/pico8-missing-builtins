#!/bin/env python

import shutil
import re

with open('package_missing.lua', 'w') as w:
    matches = []
    with open('missing.lua', 'r') as r:
        for line in r:
            match = re.match(r'function (\w+) \(', line)
            if match is not None:
                line = re.sub(r'(function \w+ \()', r'local \1', line)
                matches.append(match.group(1))
            w.write(line)
        r.close()
    w.write("\n")
    w.write('return { \n')
    for match in matches:
        w.write('  {} = {},\n'.format(match, match))
    w.write("}\n")
    w.close()
