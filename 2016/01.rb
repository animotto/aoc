#!/usr/bin/env ruby

require "set"

DIRS = [[0, 1], [1, 0], [0, -1], [-1, 0]]

input = $stdin.readline
input.chomp!

x = y = c = 0
input.split(", ").each do |char|
  dir = char[0]
  dist = char[1..-1].to_i

  d = dir == "R" ? 1 : -1
  c = (c + d) % DIRS.length
  dx, dy = DIRS[c]
  x += dx * dist
  y += dy * dist
end
dist = x.abs + y.abs
puts "Answer1: #{dist}"

x = y = c = 0
points = Set.new
input.split(", ").each do |char|
  dir = char[0]
  dist = char[1..-1].to_i

  d = dir == "R" ? 1 : -1
  c = (c + d) % DIRS.length
  dx, dy = DIRS[c]
  v = false
  dist.times do
    x += dx
    y += dy
    if points.include?([x, y])
      v = true
      break
    end
    points << [x, y]
  end
  break if v
end
dist = x.abs + y.abs
puts "Answer2: #{dist}"

