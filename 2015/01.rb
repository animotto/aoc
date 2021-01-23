#!/usr/bin/env ruby

input = $stdin.read

floor = 0
input.each_char do |char|
  if char == "("
    floor += 1
  elsif char == ")"
    floor -= 1
  end
end
puts "Answer1: #{floor}"

floor = pos = 0
input.each_char do |char|
  pos += 1
  if char == "("
    floor += 1
  elsif char == ")"
    floor -= 1
  end
  break if floor.negative?
end
puts "Answer2: #{pos}"

