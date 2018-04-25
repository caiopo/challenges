local function sort_string(str)
  str = string.lower(str)

  local arr = {}

  for i=1,#str do
    arr[i] = str:sub(i,i)
  end

  table.sort(arr)

  return table.concat(arr)
end

local function is_anagram(str1, str2)
  return sort_string(str1) == sort_string(str2)
end

local Anagram = {}
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
