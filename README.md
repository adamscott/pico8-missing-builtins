# pico8-missing-builtins
[![travis-ci](https://travis-ci.org/adamscott/pico8-missing-builtins.svg?branch=master)](https://travis-ci.org/adamscott/pico8-missing-builtins)
[![codecov](https://codecov.io/gh/adamscott/pico8-missing-toolbelt/branch/master/graph/badge.svg)](https://codecov.io/gh/adamscott/pico8-missing-toolbelt)

You miss built-in lua functions such as `ipairs` or `getmetatable` in pico8? Well, fear no more.

## Currently supported Lua "built-in" functions
- `getmetatable`
- `setmetatable`
- `rawget`
- `unpack`
- `ipairs`

## Tested to imitate their counterparts
Travis-CI is set to test `toolbelt.lua` against `test.lua`, which compares results of this library functions with the built-in ones. Well, tests may be incomplete, so do not hesitate to [flag a bug to the issue tracker](https://github.com/adamscott/pico8-missing-builtins/issues) if something goes wrong.

## How to use
Heads up to the [lastest release.](https://github.com/adamscott/pico8-missing-builtins/releases/latest) Then, there's two options:
* Either you download `toolbelt.lua` then copy the file contents into your `.p8` project file, preferably before the rest of your code; or
* you load `toolbelt.p8` in pico-8 to test it out first.
