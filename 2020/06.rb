#!/usr/bin/env ruby

answers = Hash[('a'..'z').to_a.map {|c| [c, 0]}]

input = `xclip -o`

groups = input.split("\n\n")

sum = []
groups.each do |group|
  list = answers.dup
  persons = group.split("\n")
  persons.each do |person|
    person.chomp!
    person.each_char do |char|
      list[char] = 1 if list[char].zero?
    end
  end
  sum << list.values.count(1)
end
puts "Answer1: #{sum.sum}"

sum = []
groups.each do |group|
  list = answers.dup
  persons = group.split("\n")
  persons.each do |person|
    person.chomp!
    person.each_char do |char|
      list[char] += 1
    end
  end
  sum << list.values.count {|c| c == persons.length}
end
puts "Answer2: #{sum.sum}"

