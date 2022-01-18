#!/usr/bin/env ruby

require 'set'

entries = []
$stdin.each_line(chomp: true) do |line|
  pattern, digit = line.split(' | ')
  entry = []
  entry << pattern.split(' ')
  entry << digit.split(' ')
  entries << entry
end

amount = 0
entries.each do |entry|
  entry[1].each do |digit|
    if digit.length == 2 || digit.length == 4 \
        || digit.length == 3 || digit.length == 7
      amount += 1
    end
  end
end

puts amount

sum = 0
entries.each do |entry|
  patterns = Hash.new(Set.new)
  entry[0].each do |digit|
    s = digit.chars.to_set
    patterns[1] = s if s.length == 2
    patterns[4] = s if s.length == 4
    patterns[7] = s if s.length == 3
    patterns[8] = s if s.length == 7
  end

  entry[0].each do |digit|
    s = digit.chars.to_set
    next if patterns.value?(s)

    patterns[9] = s if patterns[4].subset?(s)
  end

  entry[0].each do |digit|
    s = digit.chars.to_set
    next if patterns.value?(s)

    patterns[3] = s if s.subset?(patterns[9]) && patterns[7].subset?(s)
  end

  entry[0].each do |digit|
    s = digit.chars.to_set
    next if patterns.value?(s)

    patterns[0] = s if patterns[1].subset?(s)
  end

  entry[0].each do |digit|
    s = digit.chars.to_set
    next if patterns.value?(s)

    patterns[6] = s if (patterns[0] - patterns[1]).subset?(s)
  end

  entry[0].each do |digit|
    s = digit.chars.to_set
    next if patterns.value?(s)

    patterns[5] = s if s.subset?(patterns[9])
  end

  entry[0].each do |digit|
    s = digit.chars.to_set
    patterns[2] = s unless patterns.value?(s)
  end

  number = 0
  entry[1].each do |digit|
    s = digit.chars.to_set
    n = patterns.detect { |k, v| v == s }
    next unless n

    number = number * 10 + n[0]
  end

  sum += number
end

puts sum
