# @param {String[]} words
# @param {String} chars
# @return {Integer}
def count_characters(words, chars)
  count = 0
  achars = chars.chars

  words.each do |word|
    achars2 = achars.dup
    ok = true

    word.chars.each do |c|
      idx = achars2.find_index(c)
      if idx
        achars2.delete_at idx
      else
        ok = false
        break
      end
    end

    if ok
      count += word.size
    end
  end
  count
end

# p count_characters ["cat", "bt", "hat", "tree"], "atach"
p count_characters ["hello", "world", "leetcode"], "welldonehoneyr"
