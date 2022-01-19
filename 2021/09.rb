#!/usr/bin/env ruby

SIZE = 100

map = []
$stdin.each_line(chomp: true) do |line|
  map += line.chars.map(&:to_i)
end

def find_adjacent(map, point)
  adjacent = []
  if point < map.length - 1
    adjacent << point + 1 if point.zero? || ((point + 1) % SIZE).positive?
    adjacent << point + SIZE if point + SIZE < map.length
  end

  if point.positive?
    adjacent << point - 1 unless (point % SIZE).zero?
    adjacent << point - SIZE if point - SIZE >= 0
  end
  adjacent
end

def find_basin(map, point, basin: [])
  adjacent = find_adjacent(map, point)
  adjacent.each do |p|
    next if map[p] == 9 || basin.include?(p)

    basin << p
    basin += find_basin(map, p, basin: basin)
  end
  basin.uniq
end

points = []
map.each.with_index do |point, i|
  adjacent = find_adjacent(map, i)
  min = true
  adjacent.each do |p|
    next if point < map[p]

    min = false
    break
  end

  next unless min

  points << i
end

puts points.sum { |p| map[p] + 1 }

basins = []
points.each do |point|
  basins << find_basin(map, point)
end

basins.sort! { |a, b| -a.length <=> -b.length }
answer = 1
3.times { |i| answer *= basins[i].length }
puts answer
