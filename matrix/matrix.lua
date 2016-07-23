local function Matrix(str)
  local matrix = {}

  for linestr in str:gmatch('([^\n]+)') do
    local line = {}

    for element in linestr:gmatch('([^ ]+)') do
      line[#line+1] = tonumber(element)
    end

    matrix[#matrix+1] = line
  end

  local function row(n)
    return matrix[n]
  end

  local function column(n)
    col = {}

    for i,v in ipairs(matrix) do
      col[#col+1] = matrix[i][n]
    end

    return col
  end

  return {
    row = row,
    column = column
  }
end

return Matrix
