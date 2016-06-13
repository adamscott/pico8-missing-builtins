__setmetatable = setmetatable
__metatables = {}
function setmetatable (object, mt)
  __metatables[object] = mt
  return __setmetatable(object, mt)
end

function getmetatable (object)
  return __metatables[object]
end

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

function ipairs (arr)
  local i, n = 0, #arr
  return function ()
    i = i + 1
    if i <= n then return i, arr[i] end
  end
end
