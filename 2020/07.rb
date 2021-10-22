#!/usr/bin/env ruby

# frozen_string_literal: true

input = $stdin.read

def calc_bags1(bags, bag, search)
  return false if bags[bag].empty?
  return true if bags[bag].key?(search)

  bags[bag].each do |k, v|
    r = calc_bags1(bags, k, search)
    return r if r
  end

  false
end

def calc_bags2(bags, bag)
  return 0 if bags[bag].empty?

  i = 0
  bags[bag].each do |k, v|
    i += v + v * calc_bags2(bags, k)
  end

  i
end

bags = {}
input.each_line(chomp: true) do |line|
  tokens = line.split(' ')
  bag = "#{tokens[0]} #{tokens[1]}"
  bags[bag] = {}

  if tokens[4] == 'no'
    next
  end

  i = 0
  loop do
    b = "#{tokens[5 + (i * 4)]} #{tokens[6 + (i * 4)]}"
    bags[bag][b] = tokens[4 + (i * 4)].to_i
    last = tokens[7 + (i * 4)][-1]
    break if last == '.'

    i += 1
  end
end

answer1 = 0
bags.each do |k, v|
  answer1 += 1 if calc_bags1(bags, k, 'shiny gold')
end
puts "Answer1: #{answer1}"

answer2 = calc_bags2(bags, 'shiny gold')
puts "Answer2: #{answer2}"
