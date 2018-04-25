local function transform(old)
  local new = {}

  for i,v in pairs(old) do
    for j,v2 in ipairs(v) do
      new[v2:lower()] = i
    end
  end

  return new
end

return {
  transform = transform
}
