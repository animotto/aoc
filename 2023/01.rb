#!/usr/bin/env ruby
# frozen_string_literal: true

WORDS = {
  'one' => 1,
  'two' => 2,
  'three' => 3,
  'four' => 4,
  'five' => 5,
  'six' => 6,
  'seven' => 7,
  'eight' => 8,
  'nine' => 9
}.freeze

input = $stdin.readlines

digits = []
input.each do |line|
  d = line.scan(/[1-9]/)
  digits << d.first.to_i * 10 + d.last.to_i
end

puts(digits.sum)

digits.clear
input.each do |line|
  WORDS.each do |word, digit|
    line.gsub!(word, "#{word}#{digit}#{word}")
  end

  d = line.scan(/[1-9]/)
  digits << d.first.to_i * 10 + d.last.to_i
end

puts(digits.sum)
