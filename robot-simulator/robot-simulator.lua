local NORTH = 'north'
local SOUTH = 'south'
local EAST = 'east'
local WEST = 'west'

local function turn_right(heading)
  if heading == NORTH then
    return EAST
  elseif heading == EAST then
    return SOUTH
  elseif heading == SOUTH then
    return WEST
  else
    return NORTH
  end
end

local function turn_left(heading)
  if heading == NORTH then
    return WEST
  elseif heading == EAST then
    return NORTH
  elseif heading == SOUTH then
    return EAST
  else
    return SOUTH
  end
end

local function advance(robot)
  if robot.heading == NORTH then
    robot.y = robot.y + 1

  elseif robot.heading == EAST then
    robot.x = robot.x + 1

  elseif robot.heading == SOUTH then
    robot.y = robot.y - 1

  else
    robot.x = robot.x - 1
  end
end

local function Robot(robot)

  local function move(self, command)

    for i=1,#command do
      local c = command:sub(i,i)

      if c == 'R' then
        robot.heading = turn_right(robot.heading)

      elseif c == 'L' then
        robot.heading = turn_left(robot.heading)

      elseif c == 'A' then
        advance(robot)

      else error() end
    end

  end

  robot.move = move

  return robot
end

return Robot
