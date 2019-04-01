require 'set'

def length_of_longest_substring(s)
  set = Set.new
  ans = i = j = 0
  n = s.size

  while i < n && j < n
    #p "i=#{i}, j=#{j}"
    unless set.include?(s[j])
      set.add(s[j])
      j += 1
      ans = [ans, j - i].max
    else
      set.delete(s[i])
      i += 1
    end
  end

  ans
end

p length_of_longest_substring("abcabcbb")
p length_of_longest_substring("pwwkew")
p length_of_longest_substring("bbbbb")
p length_of_longest_substring(" ")
p length_of_longest_substring("au")
p length_of_longest_substring("dvdf")
