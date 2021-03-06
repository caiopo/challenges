local function str_to_array(str)
  local arr = {}

  for i=1,#str do
    arr[i] = str:sub(i,i)
  end

  return arr
end

local function Octal(str)
  local arr = str_to_array(str)
  local decimal = 0

  for i,v in ipairs(arr) do
    local num = tonumber(v)

    if not num or v == '8' or v == '9' then
      decimal = 0
      break
    end

    decimal = decimal + num * 8 ^ (#arr - i)
  end

  return {
    to_decimal = function() return decimal end
  }
end

return Octal
