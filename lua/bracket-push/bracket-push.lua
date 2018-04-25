local function Stack()
  local stack = {}

  local function add(element)
    stack[#stack+1] = element
  end


  local function peek()
    return stack[#stack]
  end

  local function remove()
    local temp = peek()
    stack[#stack] = nil
    return temp
  end

  return {
    add = add,
    peek = peek,
    remove = remove,
    len = function() return #stack end
  }
end

local function str_to_array(str)
  local arr = {}

  for i=1,#str do
    arr[i] = str:sub(i,i)
  end

  return arr
end

local matching = {
  ['('] = ')',
  ['{'] = '}',
  ['['] = ']',
  [')'] = false,
  ['}'] = false,
  [']'] = false,
}

local function is_bracket(c)
  return matching[c] ~= nil
end

local function is_opening_bracket(c)
  return matching[c] ~= nil and matching[c] ~= false
end

local function brackets(str)
  stack = Stack()

  arr = str_to_array(str)

  for i,v in ipairs(arr) do

    if is_bracket(v) then

      if v == matching[stack.peek()] then
        stack.remove()
      elseif is_opening_bracket(v) then
        stack.add(v)
      else
        return false
      end

    end
  end

  return stack.len() == 0
end

return {
  valid = brackets
}
