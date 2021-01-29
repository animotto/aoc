#!/usr/bin/env ruby

input = $stdin.read

lines = input.lines(chomp: true)

s1 = s2 = 0
lines.each do |line|
  letters = {}
  line.chars.each {|c| letters[c] = letters.fetch(c, 0) + 1}
  s1 += 1 if letters.detect {|k, v| v == 2}
  s2 += 1 if letters.detect {|k, v| v == 3}
end
puts "Answer1: #{s1 * s2}"

list = []
found = false
lines[0..-2].each_with_index do |a, i|
  break if found
  lines[(i + 1)..-1].each do |b|
    c = 0
    a.chars.each_index do |j|
      c += 1 if a[j] != b[j]
    end
    if c == 1
      list << a
      list << b
      found = true
      break
    end
  end
end
word = ""
list[0].chars.each_with_index do |c, i|
  word << c if list[0][i] == list[1][i]
end
puts "Answer2: #{word}"

