#!/usr/bin/env ruby

input = $stdin.read

def search(chars, n)
  marker = []
  offset = 0
  chars.chomp.each_char do |char|
    marker << char
    offset += 1

    next if marker.length < n
    marker.shift if marker.length > n

    found = true
    marker.each_with_index do |c, i|
      if marker[(i + 1)..].include?(c)
        found = false
        break
      end
    end

    break if found
  end

  offset
end

puts(search(input, 4))
puts(search(input, 14))
