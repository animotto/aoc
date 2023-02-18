#!/usr/bin/env ruby

ITEMS = \
  ('a'..'z').to_a +
  ('A'..'Z').to_a

input = $stdin.read

sum = 0
input.each_line(chomp: true) do |line|
  a = line[..(line.length / 2 - 1)]
  b = line[(line.length / 2)..]

  a.each_char do |char|
    next unless b.include?(char)

    sum += ITEMS.index(char) + 1
    break
  end
end

puts(sum)

sum = 0
items = []
input.each_line(chomp: true) do |line|
  items << line
  next if items.length < 3
  
  items[0].each_char do |char|
    next unless items[1].include?(char) && items[2].include?(char)

    sum += ITEMS.index(char) + 1
    break
  end

  items.clear
end

puts(sum)
