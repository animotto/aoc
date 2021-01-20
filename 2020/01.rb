#!/usr/bin/env ruby

input=`xclip -o`

lines = input.lines.map(&:to_i)
indexes = []

lines.each_with_index do |a, i|
  lines.each_with_index do |b, j|
    next if i == j || indexes.include?(i) || indexes.include?(j)
    if a + b == 2020
      indexes << i
      indexes << j
    end
  end
end

answer = indexes.inject(1) {|v, i| v * lines[i]}
puts "Answer: #{answer}"

