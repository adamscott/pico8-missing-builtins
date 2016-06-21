-- pico8-missing-builtins v0.2.0
-- https://github.com/adamscott/pico8-missing-builtins
__setmetatable = setmetatable
__metatables = {}
function setmetatable (object, mt)
  __metatables[object] = mt
  return __setmetatable(object, mt)
end
-- getmetatable depends on this setmetatable implementation
function getmetatable (object)
  return __metatables[object]
end

-- rawget depends on getmetatable
function rawget (tbl, index)
  assert(type(tbl) == 'table', "bad argument #1 to 'rawget' "
    .."(table expected, got "..type(tbl)..")")
  local ti = tbl.__index
  local mt = getmetatable(tbl)
  local value = nil
  tbl.__index = tbl
  __setmetatable(tbl, nil)
  value = tbl[index]
  tbl.__index = ti
  __setmetatable(tbl, mt)
  return value
end

function unpack (arr, i, j)
  local n = {}
  local k = 0
  local initial_i = i
  j = j or #arr
  for i = i or 1, j do
    k = k + 1
    n[k] = arr[i]
  end
  local l = k
  local function create_arg(l, ...)
    if l == 0 then
      return ...
    else
      return create_arg(l - 1, n[l], ...)
    end
  end
  return create_arg(l)
end

function ipairs (a)
  local function iter(a, i)
    i = i + 1
    local v = a[i]
    if v then
      return i, v
    end
  end
  return iter, a, 0
end

table = {}
table.pack = function (...) return {...} end
table.unpack = unpack

function table.insert (list, pos, value)
  assert(type(list) == 'table', "bad argument #1 to 'insert' "
    .."(table expected, got "..type(list)..")")
  if pos and not value then
    value = pos
    pos = #list + 1
  else
    assert(type(pos) == 'number', "bad argument #2 to 'insert' "
      .."(number expected, got "..type(pos)..")")
  end
  if pos <= #list then
    for i = #list, pos, -1 do
      list[i + 1] = list[i]
    end
  end
  list[pos] = value
end

function table.remove(list, pos)
  assert(type(list) == 'table', "bad argument #1 to 'remove' "
    .."(table expected, got "..type(list)..")")
  if not pos then
    pos = #list
  else
    assert(type(pos) == 'number', "bad argument #2 to 'remove' "
      .."(number expected, got "..type(tbl)..")")
  end
  for i = pos, #list do
    list[i] = list[i + 1]
  end
end

function table.sort (arr, comp)
  if not comp then
    comp = function (a, b)
      return a < b
    end
  end
  local function partition (a, lo, hi)
      pivot = a[hi]
      i = lo - 1
      for j = lo, hi - 1 do
        if comp(a[j], pivot) then
          i = i + 1
          a[i], a[j] = a[j], a[i]
        end
      end
      a[i + 1], a[hi] = a[hi], a[i + 1]
      return i + 1
    end
  local function quicksort (a, lo, hi)
    if lo < hi then
      p = partition(a, lo, hi)
      quicksort(a, lo, p - 1)
      return quicksort(a, p + 1, hi)
    end
  end
  return quicksort(arr, 1, #arr)
end
-- END pico8-missing-builtins v0.1.3
