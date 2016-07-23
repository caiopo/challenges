local function str_to_array(str)
  local arr = {}

  for i=1,#str do
    arr[i] = str:sub(i,i)
  end

  return arr
end

local function is_anagram(str1, str2)
  if #str1 ~= #str2 then
    return false
  end

  str1 = string.lower(str1)
  str2 = string.lower(str2)

  arr1 = str_to_array(str1)
  arr2 = str_to_array(str2)

  table.sort(arr1)
  table.sort(arr2)

  for i=1,#arr1 do
    if arr1[i] ~= arr2[i] then
      return false
    end
  end

  return true
end

Anagram = {}
Anagram.__index = Anagram

function Anagram:new(word)
  local detector = {}              -- our new object
  setmetatable(detector, Anagram)  -- make Anagram handle lookup
  detector.word = word             -- initialize our object
  return detector
end

function Anagram:match(candidates)
  local matches = {}

  for k,v in pairs(candidates) do
    if is_anagram(self.word, v) then
      matches[#matches+1] = v
    end
  end

  return matches
end

return Anagram
