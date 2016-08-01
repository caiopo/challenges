local function is_question(phrase)
  return phrase:sub(#phrase,#phrase) == '?'
end

local function is_yelling(phrase)
  return phrase == phrase:upper()
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
