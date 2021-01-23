#!/usr/bin/env ruby

input = $stdin.read

VOWELS = ["a", "e", "i", "o", "u"]
EXCLUSIONS = ["ab", "cd", "pq", "xy"]

n = 0
input.each_line(chomp: true) do |line|
  chars = line.chars
  next if EXCLUSIONS.detect {|e| line.index(e)}
  v = chars.count {|c| VOWELS.include?(c)}
  next if v < 3
  d = chars.zip(chars[1..-1])
  next unless d.detect {|p| p[0] == p[1]}
  n += 1
end
puts "Answer1: #{n}"

n = 0
input.each_line(chomp: true) do |line|
  chars = line.chars
  d = 0
  chars.each_index do |i|
    ((i + 2)..(chars.length - 1)).each do |j|
      d += 1 if chars[i..(i + 1)] == chars[j..(j + 1)]
    end
  end
  next if d.zero?
  d = chars.zip(chars[2..-1])
  next unless d.detect {|p| p[0] == p[1]}
  n += 1
end
puts "Answer2: #{n}"

