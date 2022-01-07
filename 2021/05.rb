#!/usr/bin/env ruby

SIZE = 1000

input = $stdin.read

grid1 = Array.new(SIZE ** 2, 0)
grid2 = grid1.dup
input.split("\n") do |line|
  coords = line.split(' -> ')
  x1, y1 = coords[0].split(',').map(&:to_i)
  x2, y2 = coords[1].split(',').map(&:to_i)

  x = [x1, x2].min
  y = [y1, y2].min

  if x1 == x2
    n = (y1 - y2).abs + 1
    n.times do |i|
      grid1[SIZE * (y + i) + x1] += 1
      grid2[SIZE * (y + i) + x1] += 1
    end
    next
  end

  if y1 == y2
    n = (x1 - x2).abs + 1
    n.times do |i|
      grid1[SIZE * y1 + x + i] += 1
      grid2[SIZE * y1 + x + i] += 1
    end
    next
  end

  n = (y1 - y2).abs + 1
  xd = x1 > x2 ? -1 : 1
  yd = y1 > y2 ? -1 : 1
  n.times do |i|
    grid2[SIZE * (y1 + i * yd) + x1 + i * xd] += 1
  end
end

puts grid1.select { |n| n >= 2 }.count
puts grid2.select { |n| n >= 2 }.count
