#!/usr/bin/env ruby

require "set"

input = $stdin.read

x = y = 0
houses = Set.new
input.each_char do |char|
  case char
  when "^"
    y += 1
  when "v"
    y -= 1
  when ">"
    x += 1
  when "<"
    x -= 1
  end
  houses.add([x, y])
end
puts "Answer1: #{houses.length}"

coords = [[0, 0], [0, 0]]
houses = Set.new
input.chars.each_with_index do |char, i|
  n = i % 2
  x, y = coords[n]
  case char
  when "^"
    y += 1
  when "v"
    y -= 1
  when ">"
    x += 1
  when "<"
    x -= 1
  end
  coords[n] = [x, y]
  houses.add([x, y])
end
puts "Answer2: #{houses.length}"

