#!/bin/env python

import shutil
import re

with open('missing.p8', 'w') as f:
    lua_content = None
    missing_content = None
    with open('missing.lua', 'r') as r:
        lua_content = ""
        for line in r:
            if re.match(r'^ {12}[\w.]+', line) is not None:
                line = re.sub(r'^ {12}([\w.]+)', r'   \1', line)
            elif re.match(r'^ {10}[\w.]+', line) is not None:
                line = re.sub(r'^ {10}([\w.]+)', r'   \1', line)
            elif re.match(r'^ {8}[\w.]+', line) is not None:
                line = re.sub(r'^ {8}([\w.]+)', r'   \1', line)
            elif re.match(r'^ {6}[\w.]+', line) is not None:
                line = re.sub(r'^ {6}([\w.]+)', r'   \1', line)
            elif re.match(r'^ {4}[\w.]+', line) is not None:
                line = re.sub(r'^ {4}([\w.]+)', r'  \1', line)
            elif re.match(r'^ {2}[\w.]+', line) is not None:
                line = re.sub(r'^ {2}([\w.]+)', r' \1', line)
            lua_content += line
        r.close()
    with open('template_missing.p8', 'r') as r:
        missing_content = r.read()
        r.close()
    missing_content = re.sub(r'\#insert_missing\#', lua_content, missing_content)
    f.write(missing_content)
