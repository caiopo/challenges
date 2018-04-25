local DNA = {}
DNA.__index = DNA

function DNA:new(dna)
  local new = {}
  setmetatable(new, DNA)

  new.nucleotideCounts = {
    ['A'] = 0,
    ['C'] = 0,
    ['G'] = 0,
    ['T'] = 0,
  }

  for i=1,#dna do
    local c = dna:sub(i,i)
    local n = new.nucleotideCounts[c]

    if n then
      new.nucleotideCounts[c] = n + 1
    end
  end

  return new
end

function DNA:count(nucleotide)
  local n = self.nucleotideCounts[nucleotide]

  if n then return n end

  error('Invalid Nucleotide')
end

return DNA
