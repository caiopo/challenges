function hello(name)
  if name then
    return 'Hello, ' .. name .. '!'
  end

  return 'Hello, world!'
end

return {
  hello = hello
}