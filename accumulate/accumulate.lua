function accumulate(old, func)
  local new = {}

  for i = 1, #old do
    new[i] = func(old[i])
  end

  return new
end

return accumulate
