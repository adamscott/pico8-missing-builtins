# pico8-missing-builtins
[![travis-ci](https://travis-ci.org/adamscott/pico8-missing-builtins.svg?branch=master)](https://travis-ci.org/adamscott/pico8-missing-builtins)
[![codecov](https://codecov.io/gh/adamscott/pico8-missing-builtins/branch/master/graph/badge.svg)](https://codecov.io/gh/adamscott/pico8-missing-builtins)

You miss built-in lua functions such as `ipairs` or `getmetatable` in [pico-8](http://www.lexaloffle.com/pico-8.php)? Well, fear no more.

## Currently supported Lua "built-in" functions
- `getmetatable`
- `setmetatable`
- `rawget`
- `unpack`
- `ipairs`

### Tested to imitate their counterparts
Travis-CI is set to test `missing.lua` against `test.lua`, which compares results of this library functions with the built-in ones. Well, tests may be incomplete, so do not hesitate to [flag a bug to the issue tracker](https://github.com/adamscott/pico8-missing-builtins/issues) if something goes wrong.

## How to use
Heads up to the [lastest release.](https://github.com/adamscott/pico8-missing-builtins/releases/latest) Then, there's two options:
* Either you download `missing.lua` then copy the file contents into your `.p8` project file, preferably before the rest of your code; or
* you load `missing.p8` in pico-8 to test it out first.

### About this license
This library is under creative commons license [CC4-BY-NC-SA](https://creativecommons.org/licenses/by-nc-sa/4.0/). See [LICENSE.md](LICENSE.md). It's the same license as the optional one on Lexaloffle's website if you choose to publish a cart.

So, if you happen to publish a cart using this library, it would be nice if you mention it.

## Thanks
To Lexaloffle, which this library would not exist without pico-8.
