local function aliquot_sum(number)
  local sum = 0

  for i=1,number-1 do
    if number % i == 0 then
      sum = sum + i
    end
  end

  return sum
end

local function classify(number)
  local asum = aliquot_sum(number)

  if asum == number then
    return 'perfect'
  elseif asum > number then
    return 'abundant'
  end

  return 'deficient'
end

return {
  aliquot_sum = aliquot_sum,
  classify = classify
}
