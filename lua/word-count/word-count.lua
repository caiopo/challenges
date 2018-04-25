function string:split(pat)
  pat = pat or '%s+'
  local st, g = 1, self:gmatch("()("..pat..")")
  local function getter(segs, seps, sep, cap1, ...)
    st = sep and seps + #sep
    return self:sub(segs, (seps or 0) - 1), cap1 or sep, ...
  end
  return function() if st then return getter(st, g()) end end
end

local function sanitize(str)
  arr = {}

  for i=1,#str do
    local c = str:sub(i,i)

    if not c:match("%W") or c == ' ' then
      arr[#arr+1] = c
    end
  end

  str = ''

  for i,v in ipairs(arr) do
    str = str .. v
  end

  return str
end

local function word_count(phrase)
  local words = {}

  phrase = sanitize(phrase)

  for w in phrase:split() do
    w = string.lower(w)

    if not words[w] then
      words[w] = 1
    else
      words[w] = words[w] + 1
    end
  end

  return words
end

return {
  word_count = word_count
}
