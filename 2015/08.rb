#!/usr/bin/env ruby

# frozen_string_literal: true

input = $stdin.read

code_chars = 0
memory_chars = 0
input.each_line do |line|
  line.chomp!
  code_chars += line.length
  i = 1
  loop do
    break if i >= line.length - 1

    if line[i] == '\\'
      i += 2 if line[i + 1] == 'x'
      i += 1
    end
    i += 1
    memory_chars += 1
  end
end

answer1 = code_chars - memory_chars
puts "Answer1: #{answer1}"

new_code_chars = 0
input.each_line do |line|
  line.chomp!
  new_line = String.new
  line.each_char do |char|
    case char
    when '\\'
      new_line << '\\\\'
    when '"'
      new_line << '\\"'
    else
      new_line << char
    end
  end
  new_line = %("#{new_line}")
  new_code_chars += new_line.length
end

answer2 = new_code_chars - code_chars
puts "Answer2: #{answer2}"
