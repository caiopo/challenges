local function binarySearch(array, element)
  if #array == 0 then return -1 end

  local lo = 1
  local hi = #array
  local mid

  while lo < hi do
    mid = (lo + hi) // 2
    if array[mid] < element then
      lo = mid + 1
    else
      hi = mid
    end
  end

  if array[lo] == element then
    return lo
  end

  return -1
end

return binarySearch
