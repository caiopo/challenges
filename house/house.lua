local head = 'This is'

local body = {
  'the horse and the hound and the horn\nthat belonged to',
  'the farmer sowing his corn\nthat kept',
  'the rooster that crowed in the morn\nthat woke',
  'the priest all shaven and shorn\nthat married',
  'the man all tattered and torn\nthat kissed',
  'the maiden all forlorn\nthat milked',
  'the cow with the crumpled horn\nthat tossed',
  'the dog\nthat worried',
  'the cat\nthat killed',
  'the rat\nthat ate',
  'the malt\nthat lay in',
  'the house that Jack built.'
}

local function verse(number)
  local rhyme = ''

  for i=#body-number+1,#body do
    rhyme = rhyme ..  ' ' .. body[i]
  end

  return head .. rhyme
end

local function recite()
  local fullVerse = verse(1)

  for i=2,#body do
    fullVerse = fullVerse .. '\n' .. verse(i)
  end

  return fullVerse
end

return {
  verse = verse,
  recite = recite
}