#!/usr/bin/env ruby

OPS = {
  1 => lambda {|a, b| a + b},
  2 => lambda {|a, b| a * b},
}

input = $stdin.read

data = input.lines(chomp: true)
prg = data[0].split(",").map(&:to_i)
out = data[1].to_i

ram = prg.clone
ram[1] = 12
ram[2] = 2
ip = 0
loop do
  op = ram[ip]
  a = ram[ip + 1]
  b = ram[ip + 2]
  c = ram[ip + 3]
  break unless OPS.key?(op)
  ram[c] = OPS[op].call(ram[a], ram[b])
  ip += 4
end
puts "Answer1: #{ram[0]}"

MAX = 99
noun = verb = 0
found = false
MAX.times do |i|
  break if found
  MAX.times do |j|
    ip = 0
    ram = prg.clone
    ram[1] = i
    ram[2] = j
    loop do
      op = ram[ip]
      a = ram[ip + 1]
      b = ram[ip + 2]
      c = ram[ip + 3]
      break unless OPS.key?(op)
      ram[c] = OPS[op].call(ram[a], ram[b])
      ip += 4
    end

    if ram[0] == out
      noun, verb = i, j
      found = true
      break
    end
  end
end
puts "Answer2: #{noun * 100 + verb}"

