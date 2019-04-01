def two_sum(nums, target)
  arr = nums.map.with_index { |v, i| [v, i] }.sort_by { |v| v[0] }
  arr.each_with_index do |a, i|
    t = target - a[0]
    r = arr[i+1, arr.size].bsearch { |v| t <=> v[0] }
    return [a[1], r[1]] if r
  end
end

p two_sum([2,7,11,15], 9)
p two_sum([3, 3], 6)
p two_sum([2,5,5,11], 10)

