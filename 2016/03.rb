#!/usr/bin/env ruby

input = $stdin.read

triangles = 0

input.each_line do |line|
  line.strip!
  a, b, c = line.split(/\s+/).map(&:to_i)
  triangles += 1 if a + b > c && b + c > a && a + c > b
end
puts "Answer1: #{triangles}"

triangles = 0
t = []
input.each_line.with_index do |line, i|
  line.strip!
  a, b, c = line.split(/\s+/).map(&:to_i)
  t << [a, b, c]
  if t.length == 3
    3.times do |j|
      if t[0][j] + t[1][j] > t[2][j] && \
          t[1][j] + t[2][j] > t[0][j] && \
          t[0][j] + t[2][j] > t[1][j]
        triangles += 1
      end
    end
    t.clear
  end
end
puts "Answer2: #{triangles}"
