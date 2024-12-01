#!/usr/bin/env ruby
# frozen_string_literal: true

left_list = []
right_list = []
$stdin.each_line(chomp: true) do |line|
  (left, right) = line.split('  ').map(&:to_i)
  left_list << left
  right_list << right
end

left_list.sort!
right_list.sort!

total = 0
left_list.each_with_index do |left, i|
  total += (right_list[i] - left).abs
end

puts(total)

score = 0
left_list.each do |left|
  score += left * right_list.count(left)
end

puts(score)
