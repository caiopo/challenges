PhoneNumber = {}
PhoneNumber.__index = PhoneNumber

local function sanitize(dirty_number)
  local clean_number = {}

  for i=1,#dirty_number do
    local c = dirty_number:sub(i,i)

    if tonumber(c) then
      clean_number[#clean_number+1] = c
    end
  end

  return table.concat(clean_number)
end

function PhoneNumber:new(dirty_number)
  local clean_number = sanitize(dirty_number)

  local phone = {}

  setmetatable(phone, PhoneNumber)

  phone.number = '0000000000'

  if #clean_number == 10 then
    phone.number = clean_number
  end

  if #clean_number == 11 and clean_number:sub(1,1) == '1' then
    phone.number = clean_number:sub(2)
  end

  return phone
end

function PhoneNumber:areaCode()
  return self.number:sub(1,3)
end

function PhoneNumber:__tostring()
  return '(' .. self.number:sub(1,3) .. ') ' ..
    self.number:sub(4,6) .. '-' .. self.number:sub(7)
end

PhoneNumber:new('(123) 456-7890')

return PhoneNumber
