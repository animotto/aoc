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
total = left_list.zip(right_list).sum { |e| (e[0] - e[1]).abs }
puts(total)

freq_list = Hash.new(0)
right_list.each { |e| freq_list[e] += 1 }
score = left_list.sum { |e| e * freq_list[e] }
puts(score)
