#!/usr/bin/env ruby

input = $stdin.read

horizon = depth = 0
input.each_line do |line|
  tokens = line.split(' ')
  action = tokens[0]
  n = tokens[1].to_i
  case action
  when 'forward'
    horizon += n
  when 'down'
    depth += n
  when 'up'
    depth -= n
  end
end

puts horizon * depth

horizon = depth = aim = 0
input.each_line do |line|
  tokens = line.split(' ')
  action = tokens[0]
  n = tokens[1].to_i
  case action
  when 'forward'
    horizon += n
    depth += aim * n
  when 'down'
    aim += n
  when 'up'
    aim -= n
  end
end

puts horizon * depth
