return function(limit)
  return coroutine.create(function()
    local sieve = {}

    for i=2,limit do
      if sieve[i] ~= false then
        for j=i*i, limit, i do
          sieve[j] = false
        end
        coroutine.yield(i)
      end
    end
  end)
end
