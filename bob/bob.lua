local function is_question(phrase)
  return phrase:sub(#phrase,#phrase) == '?'
end

local function is_yelling(phrase)
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

  if is_question(phrase) then return 'Sure' end

  if is_yelling(phrase) then return 'Whoa, chill out!' end

  return 'Whatever'
end

return {
  hey = hey
}