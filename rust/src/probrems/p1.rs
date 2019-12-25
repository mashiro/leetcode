use std::collections::HashMap;

use super::Solution;

impl Solution {
    pub fn two_sum(nums: Vec<i32>, target: i32) -> Vec<i32> {
        let mut map = HashMap::with_capacity(nums.len());

        for (i, &n) in nums.iter().enumerate() {
            let v = target - n;
            if let Some(&i2) = map.get(&v) {
                return vec![i as i32, i2 as i32];
            } else {
                map.insert(n, i);
            }
        }

        return vec![];
    }
}

#[cfg(test)]
mod tests {
    use super::Solution;

    #[test]
    fn two_some() {
        assert_eq!(vec![1, 0], Solution::two_sum(vec![2, 7, 11, 15], 9));
    }
}