#!/usr/bin/env ruby

input = $stdin.read

x = y = 0
houses = {"#{x}:#{y}" => 1}
input.each_char do |char|
  case char
  when "^"
    y += 1
  when "v"
    y -= 1
  when ">"
    x += 1
  when "<"
    x -= 1
  end
  k = "#{x}:#{y}"
  houses[k] = 0 if houses[k].nil?
  houses[k] += 1
end
puts "Answer1: #{houses.length}"

sx = sy = 0
rx = ry = 0
houses = {"#{sx}:#{sy}" => 2}
robo = false
input.each_char do |char|
  case char
  when "^"
    if robo
      ry += 1
    else
      sy += 1
    end
  when "v"
    if robo
      ry -= 1
    else
      sy -= 1
    end
  when ">"
    if robo
      rx += 1
    else
      sx += 1
    end
  when "<"
    if robo
      rx -= 1
    else
      sx -= 1
    end
  end
  k = robo ? "#{rx}:#{ry}": "#{sx}:#{sy}"
  houses[k] = 0 if houses[k].nil?
  houses[k] += 1
  robo = !robo
end
puts "Answer2: #{houses.length}"

