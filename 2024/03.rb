#!/usr/bin/env ruby
# frozen_string_literal: true

instructions = []
$stdin.each_line(chomp: true) do |line|
  instructions += line.scan(/(mul\((\d{1,3}),(\d{1,3})\)|(do|don't)\(\))/)
end

numbers = instructions \
  .select { |i| i.first.start_with?('mul') } \
  .map { |i| i[1..2].map(&:to_i) }
total = numbers.sum { |a, b| a * b }
puts(total)

numbers = []
do_instruction = true
instructions.each do |instruction|
  case instruction.first
    when "do()"
      do_instruction = true
      next

    when "don't()"
      do_instruction = false
      next
  end

  next unless do_instruction

  numbers << instruction[1..2].map(&:to_i)
end

total = numbers.sum { |a, b| a * b }
puts(total)
