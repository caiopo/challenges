local function  raindrops(number)
  local str = ''

  if (number % 3) == 0 then
    str = 'Pling'
  end

  if (number % 5) == 0 then
    str = str .. 'Plang'
  end

  if (number % 7) == 0 then
    str = str .. 'Plong'
  end

  return str ~= '' and str or tostring(number)
end

return raindrops
