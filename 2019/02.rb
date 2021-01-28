#!/usr/bin/env ruby

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

  case op
  when 1
    ram[c] = ram[a] + ram[b]
  when 2
    ram[c] = ram[a] * ram[b]
  when 99
    break
  end

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

      case op
      when 1
        ram[c] = ram[a] + ram[b]
      when 2
        ram[c] = ram[a] * ram[b]
      when 99
        break
      end

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

