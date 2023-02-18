#!/usr/bin/env ruby

input = $stdin.read

lines = input.lines
crates_num = lines.first.length / 4
stacks = Array.new(crates_num) { Array.new }
lines_enum = lines.each

loop do
  line = lines_enum.next
  next if line[1] == '1'
  break if line.chomp.empty?

  crates_num.times do |i|
    n = i * 4
    crate = line[n..(n + 4)]
    next if crate[1] == ' '

    stacks[i] << crate[1]
  end
end

stacks.map! { |s| s.reverse }

moves = []
loop do
  line = lines_enum.next
  tokens = line.split(' ', 6)
  n = tokens[1].to_i
  from = tokens[3].to_i
  to = tokens[5].to_i
  moves << [tokens[1].to_i, tokens[3].to_i, tokens[5].to_i]
rescue StopIteration
  break
end

stacks1 = Marshal.load(Marshal.dump(stacks))
moves.each do |move|
  move[0].times do |i|
    stacks1[move[2] - 1] << stacks1[move[1] - 1].pop
  end
end

top = stacks1.inject([]) { |top, s| top << s.last }
puts(top.join)

stacks2 = Marshal.load(Marshal.dump(stacks))
moves.each do |move|
  stacks2[move[2] - 1] += stacks2[move[1] - 1].pop(move[0])
end

top = stacks2.inject([]) { |top, s| top << s.last }
puts(top.join)
