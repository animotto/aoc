#!/usr/bin/env ruby

input = $stdin.read

def checksum(groups)
  letters = {}
  groups.each do |group|
    group.each_char do |char|
      letters[char] = 0 if letters[char].nil?
      letters[char] += 1
    end
  end
  letters.sort_by { |k, v| [-v, k] }[0..4].map { |a| a[0] }.join
end

sum = 0
input.each_line(chomp: true) do |line|
  groups = line.split('-')
  groups.last =~ /(\d+)\[(\w+)\]/
  sector_id = $1
  check_sum = $2
  sum += sector_id.to_i if checksum(groups[0..-2]) == check_sum
end
puts "Answer1: #{sum}"

alphabet = ('a'..'z').to_a
id = 0
input.each_line(chomp: true) do |line|
  groups = line.split('-')
  groups.last =~ /(\d+)\[(\w+)\]/
  sector_id = $1
  check_sum = $2
  name = ''
  id = sector_id.to_i
  groups[0..-2].each do |group|
    group.each_char do |char|
      n = char.ord - 'a'.ord
      id.times { n = (n + 1) % 26 }
      name << alphabet[n]
    end
    name << ' '
  end
  break if name =~ /northpole/
end
puts "Answer2: #{id}"
