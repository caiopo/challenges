local alphabet = 'abcdefghijklmnopqrstuvwxyz'

local function is_pangram(str)
  for i=1,#alphabet do
    local v = alphabet:sub(i,i)
    if not string.lower(str):match(v) then
      return false
    end
  end

  return true
end

return is_pangram
