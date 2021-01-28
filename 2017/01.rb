#!/usr/bin/env ruby

input = $stdin.read
nums = input.chomp.chars.map(&:to_i)
length = nums.length

sum = 0
nums.each_index do |i|
  sum += nums[i] if nums[i] == nums[(i + 1) % length]
end
puts "Answer1: #{sum}"

sum = 0
(length / 2).times do |i|
  sum += nums[i] * 2 if nums[i] == nums[i + length / 2]
end
puts "Answer2: #{sum}"

