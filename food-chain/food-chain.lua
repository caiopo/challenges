local head = 'I know an old lady who swallowed a '

local animals = {
  {
    "fly",
    "",
    "I don't know why she swallowed the fly. Perhaps she'll die.\n"
  },
  {
    "spider",
    "It wriggled and jiggled and tickled inside her.\n",
    "She swallowed the spider to catch the fly.\n"
  },
  {
    "bird",
    "How absurd to swallow a bird!\n",
    "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n"
  },
  {
    "cat",
    "Imagine that, to swallow a cat!\n",
    "She swallowed the cat to catch the bird.\n"
  },
  {
    "dog",
    "What a hog, to swallow a dog!\n",
    "She swallowed the dog to catch the cat.\n"
  },
  {
    "goat",
    "Just opened her throat and swallowed a goat!\n",
    "She swallowed the goat to catch the dog.\n"
  },
  {
    "cow",
    "I don't know how she swallowed a cow!\n",
    "She swallowed the cow to catch the goat.\n"
  },
  {
    "horse",
    "She's dead, of course!\n",
    ""
  }
}

local function verse(n)
  local result = head .. animals[n][1] .. '.\n'
    .. animals[n][2] .. animals[n][3]


  if n < 8 then
    for i=n-1,1,-1 do
      result = result .. animals[i][3]
    end
  end

  return result
end

local function verses(from, to)
  local result = ''

  for i=from,to do
    result = result .. verse(i) .. '\n'
  end

  return result
end

local function sing(n)
  return verses(1, 8)
end

return {
  verse = verse,
  verses = verses,
  sing = sing
}
