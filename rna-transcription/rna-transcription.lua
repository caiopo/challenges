local equivalent = {
  ['G'] = 'C',
  ['C'] = 'G',
  ['T'] = 'A',
  ['A'] = 'U',
}

local function to_rna(dna)
  local rna = {}

  for i=1,#dna do
    rna[#rna+1] = equivalent[dna:sub(i,i)]
  end

  return table.concat(rna)
end

return to_rna
