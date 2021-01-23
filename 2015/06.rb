#!/usr/bin/env ruby

input = $stdin.read

SIZE = 1000

grid = Array.new(SIZE ** 2, false)
input.each_line(chomp: true) do |line|
  words = line.split(" ")
  x1, y1 = words[-3].split(",", 2).map(&:to_i)
  x2, y2 = words[-1].split(",", 2).map(&:to_i)
  action = words[0] == "turn" ? words[1] : words[0]
  (x1..x2).each do |x|
    (y1..y2).each do |y|
      c = x * SIZE + y
      case action
      when "on"
        grid[c] = true
      when "off"
        grid[c] = false
      when "toggle"
        grid[c] = !grid[c]
      end
    end
  end
end
puts "Answer1: #{grid.count {|c| c}}"

grid = Array.new(SIZE ** 2, 0)
input.each_line(chomp: true) do |line|
  words = line.split(" ")
  x1, y1 = words[-3].split(",", 2).map(&:to_i)
  x2, y2 = words[-1].split(",", 2).map(&:to_i)
  action = words[0] == "turn" ? words[1] : words[0]
  (x1..x2).each do |x|
    (y1..y2).each do |y|
      c = x * SIZE + y
      case action
      when "on"
        grid[c] += 1
      when "off"
        grid[c] = [0, grid[c] - 1].max
      when "toggle"
        grid[c] += 2
      end
    end
  end
end
puts "Answer2: #{grid.sum}"

