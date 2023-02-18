#!/usr/bin/env ruby

input = $stdin.read

pairs = []
input.each_line(chomp: true) do |line|
  range1, range2 = line.split(',', 2)
  range1_a, range1_b = range1.split('-', 2).map(&:to_i)
  range2_a, range2_b = range2.split('-', 2).map(&:to_i)
  pairs << [[range1_a, range1_b], [range2_a, range2_b]]
end

sum = 0
pairs.each do |pair|
  if (pair[0][0] >= pair[1][0] && pair[0][1] <= pair[1][1]) \
   || (pair[1][0] >= pair[0][0] && pair[1][1] <= pair[0][1])
   sum += 1
  end
end

puts(sum)

sum = 0
pairs.each do |pair|
  if pair[0][1] - pair[1][0] >= 0 && pair[1][1] - pair[0][0] >= 0
    sum += 1
  end
end

puts(sum)
