return function(sublist, superlist)
  if #sublist == 0 then return true end

  local match = 0

  for i=1,#superlist do
    if superlist[i] == sublist[match+1] then
      match = match + 1

      if match == #sublist then return true end
    end
  end

  return false
end
