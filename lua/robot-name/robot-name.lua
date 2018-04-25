math.randomseed(os.time())

Robot = {}
Robot.__index = Robot

local function genname()
  local name = ''

  for i=1,2 do
    name = name .. string.char(math.random(65, 90))
  end

  for i=1,3 do
    name = name .. math.random(0, 9)
  end

  return name
end

function Robot:new()
  return setmetatable({ name = genname() }, Robot)
end

function Robot:reset()
  self.name = genname()
end

return Robot
