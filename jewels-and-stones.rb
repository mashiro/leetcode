# @param {String} j
# @param {String} s
# @return {Integer}
def num_jewels_in_stones(j, s)
  jewels = j.split('')
  s.chars.select { |stone| jewels.include? stone }.size
end

p num_jewels_in_stones('aA', 'aAAbbbb')
