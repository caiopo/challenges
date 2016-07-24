local function sum_of_multiples(numbers)
  function to(max)
    local sum = 0

    for i=1,max-1 do
      for j,v in ipairs(numbers) do
        if i % v == 0 then
          sum = sum + i
          break
        end
      end
    end

    return sum
  end

  return {
    to = to
  }
end

return sum_of_multiples
