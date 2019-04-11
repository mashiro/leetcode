# @param {String} s
# @return {String}
def remove_outer_parentheses(s)
  result = ""
  depth = 0
  s.chars.each do |c|
    case c
    when "("
      depth += 1
      result += c if depth > 1
    when ")"
      depth -= 1
      result += c if depth > 0
    end
  end
  result
end

p remove_outer_parentheses("(()())(())")
p remove_outer_parentheses("(()())(())(()(()))")