#!/usr/bin/env ruby

input = $stdin.read

calories = []
sum = 0
input.each_line(chomp: true) do |line|
  if line.empty?
    calories << sum
    sum = 0
    next
  end

  sum += line.to_i
end

calories.sort! { |a, b| b <=> a }
puts(calories.max)
sum = 0
3.times { |i| sum += calories[i] }
puts(sum)
