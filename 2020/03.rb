#!/usr/bin/env ruby

input = `xclip -o`

map = input.lines(chomp: true)

right = down = 0
trees = 0
while (down += 1) < map.length do
  right = (right + 3) % map[down].length
  trees += 1 if map[down][right] == "#"
end
puts "Answer1: #{trees}"

slopes = [
  [1, 1],
  [3, 1],
  [5, 1],
  [7, 1],
  [1, 2],
]
trees = []
slopes.each_with_index do |slope, i|
  right = down = 0
  trees[i] = 0
  while (down += slope[1]) < map.length do
    right = (right + slope[0]) % map[down].length
    trees[i] += 1 if map[down][right] == "#"
  end
end

product = trees.inject(:*)
puts "Answer2: #{product}"

