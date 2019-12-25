# def two_sum(nums, target)
#   arr = nums.map.with_index { |v, i| [v, i] }.sort_by { |v| v[0] }
#   arr.each_with_index do |a, i|
#     t = target - a[0]
#     r = arr[i + 1, arr.size].bsearch { |v| t <=> v[0] }
#     return [a[1], r[1]] if r
#   end
# end

def two_sum(nums, target)
  d = {}
  nums.each_with_index do |n, i|
    d[n] = i
  end
  nums.each_with_index do |n, i|
    v = target - n
    return [i, d[v]] if d.key?(v) and d[v] != i
  end
end

require 'test-unit'

class T < Test::Unit::TestCase
  test 't' do
    assert_equal([0, 1], two_sum([2, 7, 11, 15], 9))
  end
end
