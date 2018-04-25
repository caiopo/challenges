local function square(n)
  return 2^(n-1)
end

local function total()
  local total = 0

  for i=1,64 do
    total = total + square(i)
  end

  return total
end


return {
  square = square,
  total = total,
}
