local function isQuestion(phrase)
  return phrase:sub(#phrase,#phrase) == '?'
end

local function isYelling(phrase)
  for i=1,#phrase do
    local c = phrase:sub(i,i)

    if c ~= string.upper(c) then
      return false
    end
  end
  return true
end

local function hey(phrase)
  if phrase == '' then return 'Fine, be that way.' end

  if isQuestion(phrase) then return 'Sure' end

  if isYelling(phrase) then return 'Whoa, chill out!' end

  return 'Whatever'
end

return {
  hey = hey
}