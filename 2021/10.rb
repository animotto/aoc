#!/usr/bin/env ruby

input = $stdin.readlines(chomp: true)

CHARS = {
  '(' => ')',
  '[' => ']',
  '{' => '}',
  '<' => '>'
}.freeze

corrupted = []
complete = []
input.each do |line|
  stack = []
  line.each_char do |char|
    if CHARS.key?(char)
      stack << char
      next
    end

    next if stack.empty?

    if CHARS[stack[-1]] != char
      corrupted << char
      stack.clear
      break
    end

    stack.pop
  end

  unless stack.empty?
    remain = []
    stack.reverse_each { |c| remain << CHARS[c] }
    complete << remain
  end
end

score = 0
corrupted.each do |char|
  score += 3 if char == ')'
  score += 57 if char == ']'
  score += 1197 if char == '}'
  score += 25137 if char == '>'
end
puts score

scores = []
complete.each do |line|
  score = 0
  line.each do |char|
    score *= 5
    score += 1 if char == ')'
    score += 2 if char == ']'
    score += 3 if char == '}'
    score += 4 if char == '>'
  end
  scores << score
end
scores.sort!
puts scores[scores.length / 2]
