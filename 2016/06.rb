#!/usr/bin/env ruby

input = $stdin.read

message = ''
8.times do |i|
  letters = {}
  input.each_line(chomp: true) do |line|
    char = line[i]
    letters[char] = 0 if letters[char].nil?
    letters[char] += 1
  end
  l = letters.sort_by { |k, v| -v }
  message << l[0][0]
end
puts "Answer1: #{message}"

message = ''
8.times do |i|
  letters = {}
  input.each_line(chomp: true) do |line|
    char = line[i]
    letters[char] = 0 if letters[char].nil?
    letters[char] += 1
  end
  l = letters.sort_by { |k, v| v }
  message << l[0][0]
end
puts "Answer2: #{message}"
