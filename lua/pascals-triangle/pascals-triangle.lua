return function(nrows)
  local rows = { { 1 } }

  for row=2,nrows do
    rows[row] = {}
    for i=1,row do
      rows[row][i] = (rows[row-1][i-1] or 0) + (rows[row-1][i] or 0)
    end
  end

  return {
    rows = rows,
    last_row = rows[#rows]
  }
end
