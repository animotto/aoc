#!/usr/bin/env ruby

input=`xclip -o`

passwords = 0
input.each_line(chomp: true) do |line|
  line.match(/^(\d+)-(\d+) (\w): (\w+)$/) do |m|
    min = m[1].to_i
    max = m[2].to_i
    count = m[4].count(m[3])
    passwords += 1 if count.between?(min, max)
  end
end
puts "Answer1: #{passwords}"

passwords = 0
input.each_line(chomp: true) do |line|
  line.match(/^(\d+)-(\d+) (\w): (\w+)$/) do |m|
    pos1 = m[1].to_i - 1
    pos2 = m[2].to_i - 1
    passwords += 1 if (m[4][pos1] == m[3]) ^ (m[4][pos2] == m[3])
  end
end
puts "Answer2: #{passwords}"

