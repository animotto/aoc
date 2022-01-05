#!/usr/bin/env ruby

input = $stdin.read

count = prev = 0
input.each_line do |line|
  n = line.to_i
  if prev.zero?
    prev = n
    next
  end

  count += 1 if n > prev
  prev = n
end

puts count

count = prev = offset = 0
data = []
input.each_line { |line| data << line.to_i }
while offset + 3 <= data.length do
  sum = data[offset] + data[offset + 1] + data[offset + 2]
  offset += 1
  if prev.zero?
    prev = sum
    next
  end

  count += 1 if sum > prev
  prev = sum
end

puts count
