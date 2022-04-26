#!/usr/bin/env ruby

WIDTH = 50
HEIGHT = 6
SIZE = WIDTH * HEIGHT

grid = Array.new(SIZE, 0)

$stdin.each_line do |line|
  tokens = line.split(' ')
  case tokens[0]
  when 'rect'
    t = tokens[1].split('x')
    w = t[0].to_i
    h = t[1].to_i
    h.times do |i|
      w.times do |j|
        grid[i * WIDTH + j] = 1
      end
    end

  when 'rotate'
    t = line.split('=')[1].split(' ')
    a = t[0].to_i
    b = t[2].to_i
    case tokens[1]
    when 'row'
      row = a * WIDTH
      b.times do |i|
        n = grid[row]
        WIDTH.times do |j|
          c = n
          x = row + j + 1
          x = row if x >= row + WIDTH
          n = grid[x]
          grid[x] = c
        end
      end

    when 'column'
      b.times do |i|
        n = grid[a]
        HEIGHT.times do |j|
          c = n
          x = (a + WIDTH + WIDTH * j) % SIZE
          n = grid[x]
          grid[x] = c
        end
      end
    end
  end
end

puts grid.count(1)

puts
(SIZE).times do |i|
  puts if !i.zero? && (i % WIDTH).zero?
  print grid[i].positive? ? '#' : ' '
end
puts
