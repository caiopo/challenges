local translations = {
  ['AUG'] = 'Methionine',

  ['UUU'] = 'Phenylalanine',
  ['UUC'] = 'Phenylalanine',

  ['UUA'] = 'Leucine',
  ['UUG'] = 'Leucine' ,

  ['UCU'] = 'Serine',
  ['UCC'] = 'Serine',
  ['UCA'] = 'Serine',
  ['UCG'] = 'Serine',

  ['UAU'] = 'Tyrosine',
  ['UAC'] = 'Tyrosine',

  ['UGU'] = 'Cysteine',
  ['UGC'] = 'Cysteine',

  ['UGG'] = 'Tryptophan',

  ['UAA'] = 'STOP',
  ['UAG'] = 'STOP',
  ['UGA'] = 'STOP',
}

local function codon(letters)
  local protein = translations[letters]

  if not protein then error() end

  return protein
end

local function rna_strand(rna)
  local proteins = {}

  local i = 1

  while i < #rna do
    local prot = codon(rna:sub(i, i+2))

    if prot == 'STOP' then
      return proteins
    end

    proteins[#proteins+1] = prot

    i = i + 3
  end

  return proteins
end


return {
  codon = codon,
  rna_strand = rna_strand,
}