#!/usr/bin/env ruby

input = $stdin.read

sum = 0
input.each_line(chomp: true) do |line|
  sum += line.to_i / 3 - 2
end
puts "Answer1: #{sum}"

sum = 0
input.each_line(chomp: true) do |line|
  m = line.to_i
  while (m = m / 3 - 2) > 0
    sum += m
  end
end
puts "Answer2: #{sum}"

