#!/bin/env python

import shutil
import re

with open('toolbelt.p8', 'w') as f:
    lua_content = None
    toolbelt_content = None
    with open('toolbelt.lua', 'r') as r:
        lua_content = r.read()
        r.close()
    with open('template_toolbelt.p8', 'r') as r:
        toolbelt_content = r.read()
        r.close()
    toolbelt_content = re.sub(r'\#insert_toolbelt\#', lua_content, toolbelt_content)
    f.write(toolbelt_content)
