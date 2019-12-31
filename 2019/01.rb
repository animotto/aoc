#!/usr/bin/env ruby

input = `xclip -o`

fuel1 = 0
input.each_line do |mass|
  fuel1 += mass.to_i / 3 - 2
end
puts "Answer 1: #{fuel1}"

fuel2 = 0
input.each_line do |mass|
  f = mass.to_i
  while (f = f / 3 - 2) > 0
    fuel2 += f
  end
end
puts "Answer 2: #{fuel2}"
