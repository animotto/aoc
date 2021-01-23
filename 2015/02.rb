#!/usr/bin/env ruby

input = $stdin.read

total = 0
input.each_line(chomp: true) do |line|
  l, w, h = line.split("x", 3).map(&:to_i)
  s1 = l * w
  s2 = w * h
  s3 = h * l
  s = [s1, s2, s3].min
  t = 2 * s1 + 2 * s2 + 2 * s3
  total += t + s
end
puts "Answer1: #{total}"

total = 0
input.each_line(chomp: true) do |line|
  l, w, h = line.split("x", 3).map(&:to_i)
  p1 = l * 2 + w * 2
  p2 = w * 2 + h * 2
  p3 = h * 2 + l * 2
  p = [p1, p2, p3].min
  v = l * w * h
  total += p + v
end
puts "Answer2: #{total}"

