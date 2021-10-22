#!/usr/bin/env ruby

# frozen_string_literal: true

input = $stdin.read

numbers = []
input.each_line(chomp: true) do |line|
  numbers << line.to_i
end

answer1 = 0
numbers.each.with_index do |n, i|
  next if i < 25

  s = i - 25
  e = i - 1
  found = false
  numbers[s..e].each.with_index do |a, j|
    break if found

    numbers[(s + j)..e].each do |b|
      if a + b == n
        found = true
        break
      end
    end
  end

  unless found
    answer1 = n
    break
  end
end

puts "Answer1: #{answer1}"

range = []
found = false
numbers.each.with_index do |a, i|
  break if found

  range << a
  numbers.each.with_index do |b, j|
    next if j <= i

    range << b
    if range.sum > answer1
      range.clear
      break
    end

    if range.sum == answer1
      found = true
      break
    end
  end
end

answer2 = range.minmax.sum
puts "Answer2: #{answer2}"
