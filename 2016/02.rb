#!/usr/bin/env ruby

input = $stdin.read

code = []
x = y = 1
input.each_line(chomp: true) do |line|
  line.chars do |char|
    case char
    when "R"
      x = [2, x + 1].min
    when "L"
      x = [0, x - 1].max
    when "U"
      y = [0, y - 1].max
    when "D"
      y = [2, y + 1].min
    end
  end
  code << y * 3 + x + 1
end
puts "Answer1: #{code.join}"

keypad = %w[
  0 0 1 0 0
  0 2 3 4 0
  5 6 7 8 9
  0 A B C 0
  0 0 D 0 0
]

code = []
x = 0
y = 2

input.each_line(chomp: true) do |line|
  line.each_char do |char|
    case char
    when 'R'
      xx = [4, x + 1].min
      x = xx if keypad[y * 5 + xx] != '0'
    when 'L'
      xx = [0, x - 1].max
      x = xx if keypad[y * 5 + xx] != '0'
    when 'U'
      yy = [0, y - 1].max
      y = yy if keypad[yy * 5 + x] != '0'
    when 'D'
      yy = [4, y + 1].min
      y = yy if keypad[yy * 5 + x] != '0'
    end
  end
  code << keypad[y * 5 + x]
end
puts "Answer2: #{code.join}"
