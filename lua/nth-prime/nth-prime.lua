local function is_prime(n)
  if n <= 3 then
      return n >= 2
  elseif n % 2 == 0 or n % 3 == 0 then
      return false
  end

  for i=5, math.floor(n^0.5)+1, 6 do
    if n % i == 0 or n % (i + 2) == 0 then
      return false
    end
  end

  return true
end

local function nth_prime(n)
  if n <= 0 then error() end

  local count = 0
  local current = 1

  while count < n do
    current = current + 1
    if is_prime(current) then
      count = count + 1
    end
  end

  return current
end

return nth_prime
