# @param {Integer[]} nums
# @return {Integer}
def rob(nums)
  Calc.new(nums).run
end

class Calc
  def initialize(nums)
    @nums = nums
    @memo = {}
  end

  def run
    [calc(0), calc(1)].max
  end

  def calc(i)
    return 0 if i >= @nums.size
    return @memo[i] if @memo.key?(i)

    a = @nums[i] + calc(i + 2)
    b = @nums[i] + calc(i + 3)
    @memo[i] = [a, b].max
  end
end
