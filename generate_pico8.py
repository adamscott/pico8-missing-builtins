#!/bin/env python

import shutil
import re

with open('missing.p8', 'w') as f:
    lua_content = None
    missing_content = None
    with open('missing.lua', 'r') as r:
        lua_content = r.read()
        r.close()
    with open('template_missing.p8', 'r') as r:
        missing_content = r.read()
        r.close()
    missing_content = re.sub(r'\#insert_missing\#', lua_content, missing_content)
    f.write(missing_content)
