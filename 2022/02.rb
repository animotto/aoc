#!/usr/bin/env ruby

SHAPES_A = ['A', 'B', 'C']
SHAPES_B = ['X', 'Y', 'Z']
LOST = 0
DRAW = 3
WON = 6

input = $stdin.read

score = 0
input.each_line(chomp: true) do |line|
  a, b = line.split(' ', 2)
  i = SHAPES_A.index(a)
  j = SHAPES_B.index(b)
  if i == j
    score += DRAW
  elsif (i + 1) % SHAPES_A.length == j
    score += WON
  elsif (j + 1) % SHAPES_B.length == i
    score += LOST
  end

  score += j + 1
end

puts(score)

score = 0
input.each_line(chomp: true) do |line|
  a, b = line.split(' ', 2)
  i = SHAPES_A.index(a)
  j = SHAPES_B.index(b)

  case j
  when 0
    score += LOST + (i - 1) % SHAPES_A.length
  when 1
    score += DRAW + i
  when 2
    score += WON + (i + 1) % SHAPES_A.length
  end

  score += 1
end

puts(score)
