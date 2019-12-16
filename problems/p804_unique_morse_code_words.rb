$table = [".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]

# @param {String[]} words
# @return {Integer}
def unique_morse_representations(words)
  words.map do |word|
    word.chars.map { |c| $table[c.ord - 'a'.ord] }.join('')
  end.uniq.size
end

p unique_morse_representations(["gin", "zen", "gig", "msg"])