#!/usr/bin/env ruby

input = $stdin.read

sum = 0
input.each_line(chomp: true) do |line|
  nums = line.split("\t").map(&:to_i)
  sum += nums.max - nums.min
end
puts "Answer1: #{sum}"

sum = 0
input.each_line(chomp: true) do |line|
  nums = line.split("\t").map(&:to_i)
  nums.each do |a|
    nums.each do |b|
      sum += a / b if a % b == 0 && a != b
    end
  end
end
puts "Answer2: #{sum}"

