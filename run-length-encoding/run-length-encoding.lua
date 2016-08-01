local function encode(str)
  local result = ''
  local count = 1
  local current = str:sub(1,1)

  for i=2,#str+1 do
    local c = str:sub(i,i)

    if c == current then
      count = count + 1
    else
      result = result .. (count ~= 1 and count or '') .. current
      count = 1
      current = c
    end
  end

  return result
end

local function decode(str)
  local result = ''

  local i = 1

  while i <= #str do
    local c = str:sub(i,i)

    local n = tonumber(c)

    if n then
      result = result .. string.rep(str:sub(i+1,i+1), n)

      i = i + 2
    else
      result = result .. c
      i = i + 1
    end
  end

  return result
end

return {
  encode = encode,
  decode = decode,
}
