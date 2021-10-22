#!/usr/bin/env ruby

# frozen_string_literal: true

input = $stdin.read

code = []
input.each_line(chomp: true) do |line|
  tokens = line.split(' ')
  code << [tokens[0], tokens[1].to_i, 0]
end

acc = 0
pc = 0
loop do
  code[pc][2] += 1
  break if code[pc][2] >= 2

  case code[pc][0]
  when 'acc'
    acc += code[pc][1]
  when 'jmp'
    pc += code[pc][1]
    next
  end

  pc += 1
end
puts "Answer1: #{acc}"

code.each { |c| c[2] = 0 }
acc = 0
pc = 0
terminated = false
code.each.with_index do |c, i|
  break if terminated
  next unless c[0] == 'nop' || c[0] == 'jmp'

  code_copy = Marshal.load(Marshal.dump(code))
  code_copy[i][0] = code_copy[i][0] == 'nop' ? 'jmp' : 'nop'

  acc = 0
  pc = 0
  loop do
    if pc >= code_copy.length
      terminated = true
      break
    end

    code_copy[pc][2] += 1
    break if code_copy[pc][2] >= 2

    case code_copy[pc][0]
    when 'acc'
      acc += code_copy[pc][1]
    when 'jmp'
      pc += code_copy[pc][1]
      next
    end

    pc += 1
  end
end

puts "Answer2: #{acc}"
