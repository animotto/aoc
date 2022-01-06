#!/usr/bin/env ruby

input = $stdin.read

gamma = epsilon = 0
12.times do |i|
  g0 = g1 = 0
  e0 = e1 = 0
  input.each_line do |line|
    n = line.to_i(2) >> (11 - i) & 1
    if n.zero?
      g0 += 1
      e0 += 1
    else
      g1 += 1
      e1 += 1
    end
  end

  gamma <<= 1
  gamma = g0 > g1 ? gamma | 0 : gamma | 1
  epsilon <<= 1
  epsilon = e0 < e1 ? epsilon | 0 : epsilon | 1
end

puts gamma * epsilon

numbers = input.lines.map { |n| n.to_i(2) }
oxygen = numbers.dup
co2 = numbers.dup
n0 = []
n1 = []

12.times do |i|
  n0.clear
  n1.clear
  oxygen.each do |number|
    n = number >> (11 - i) & 1
    n.zero? ? n0 << number : n1 << number
  end

  oxygen = n1.length >= n0.length ? n1.dup : n0.dup

  break if oxygen.length == 1
end

12.times do |i|
  n0.clear
  n1.clear
  co2.each do |number|
    n = number >> (11 - i) & 1
    n.zero? ? n0 << number : n1 << number
  end

  co2 = n0.length <= n1.length ? n0.dup : n1.dup

  break if co2.length == 1
end

puts oxygen.first * co2.first
