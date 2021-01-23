#!/usr/bin/env ruby

require "digest/md5"

input = $stdin.read

n = 0
loop do
  n += 1
  h = Digest::MD5.hexdigest("#{input}#{n}")
  break if h.start_with?("0" * 5)
end
puts "Answer1: #{n}"

n = 0
loop do
  n += 1
  h = Digest::MD5.hexdigest("#{input}#{n}")
  break if h.start_with?("0" * 6)
end
puts "Answer2: #{n}"

