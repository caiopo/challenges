local two = '2 bottles of beer on the wall, 2 bottles of beer.\n' ..
  'Take one down and pass it around, 1 bottle of beer on the wall.\n'

local one = '1 bottle of beer on the wall, 1 bottle of beer.\n' ..
  'Take it down and pass it around, no more bottles of beer on the wall.\n'

local zero = 'No more bottles of beer on the wall, no more bottles of beer.\n' ..
  'Go to the store and buy some more, 99 bottles of beer on the wall.\n'


function other(n)
  return n .. ' bottles of beer on the wall, ' .. n ..
    ' bottles of beer.\nTake one down and pass it around, '
    .. (n-1) .. ' bottles of beer on the wall.\n'
end

function verse(n)
  if n == 0 then
    return zero
  elseif n == 1 then
    return one
  elseif n == 2 then
    return two
  end
  return other(n)
end

function sing(from, to)
  if not to then to = 0 end

  local song = verse(from)
  for i=from-1,to,-1 do
    song = song .. '\n' .. verse(i)
  end
  return song
end

return {
  verse = verse,
  sing = sing,
}