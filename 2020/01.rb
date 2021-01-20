#!/usr/bin/env ruby

input=`xclip -o`

lines = input.lines.map(&:to_i)

indexes = []
lines.each_with_index do |a, i|
  next if indexes.include?(i)
  lines.each_with_index do |b, j|
    next if i == j || indexes.include?(j)
    if a + b == 2020
      indexes << i
      indexes << j
    end
  end
end
answer = indexes.inject(1) {|v, i| v * lines[i]}
puts "Answer1: #{answer}"

indexes = []
lines.each_with_index do |a, i|
  next if indexes.include?(i)
  lines.each_with_index do |b, j|
    next if i == j || indexes.include?(j)
    lines.each_with_index do |c, k|
      next if i == k || indexes.include?(k)
      if a + b + c == 2020
        indexes << i
        indexes << j
        indexes << k
      end
    end
  end
end
answer = indexes.inject(1) {|v, i| v * lines[i]}
puts "Answer2: #{answer}"

