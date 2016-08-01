local function compute(dna1, dna2)
  local distance = 0

  for i = 1,#dna1 do
    if dna1:sub(i,i) ~= dna2:sub(i,i) then
      distance = distance + 1
    end
  end

  return distance
end

return {
  compute = compute
}
