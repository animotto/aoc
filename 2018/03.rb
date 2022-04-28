#!/usr/bin/env ruby

SIZE = 1000

fabric = Array.new(SIZE**2) { [0] }
claims = []

$stdin.each_line do |line|
  line.chomp!
  next unless line =~ /^#(\d+) @ (\d+),(\d+): (\d+)x(\d+)$/

  id = Regexp.last_match(1).to_i
  left = Regexp.last_match(2).to_i
  top = Regexp.last_match(3).to_i
  width = Regexp.last_match(4).to_i
  height = Regexp.last_match(5).to_i

  claims << id

  height.times do |i|
    width.times do |j|
      n = (top + i) * SIZE + left + j
      fabric[n][0] += 1
      fabric[n] << id
    end
  end
end

puts fabric.count { |a| a[0] >= 2 }

claim = nil
claims.each do |id|
  list = fabric.filter { |a| a[1..-1].include?(id) }
  next unless list.all? { |a| a.length == 2 }

  claim = id
  break
end

puts claim
