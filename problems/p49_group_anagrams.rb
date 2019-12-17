# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs)
  group = Hash.new { |h, k| h[k] = [] }
  strs.each do |str|
    group[hash(str)] << str
  end
  group.values
end

def hash(str)
  str.chars.sort.join
end

p group_anagrams(["eat", "tea", "tan", "ate", "nat", "bat"])
p group_anagrams(["cab", "tin", "pew", "duh", "may", "ill", "buy", "bar", "max", "doc"])
