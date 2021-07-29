#!/usr/bin/env ruby

require 'digest'

input = $stdin.read
input.strip!

i = 0
password = ''
until password.length == 8
  hash = Digest::MD5.hexdigest("#{input}#{i}")
  i += 1
  next unless hash[0..4] == '00000'
  password << hash[5]
end
puts "Answer1: #{password}"

i = n = 0
password = ' ' * 8
until n == 8
  hash = Digest::MD5.hexdigest("#{input}#{i}")
  i += 1
  next unless hash[0..4] == '00000'
  p = hash[5].to_i(16)
  next unless p.between?(0, 7)
  next unless password[p] == ' '
  n += 1
  password[p] = hash[6]
end
puts "Answer2: #{password}"
