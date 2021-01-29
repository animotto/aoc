#!/usr/bin/env ruby

input = $stdin.read

freq = input.lines.inject(0) {|s, n| s += n.to_i}
puts "Answer1: #{freq}"

nums = input.lines.map(&:to_i)
list = []
freq = i = 0
loop do
  freq += nums[i % nums.size]
  break if list.include?(freq)
  list << freq
  i += 1
end
puts "Answer2: #{freq}"

