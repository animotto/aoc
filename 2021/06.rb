#!/usr/bin/env ruby

fish = $stdin.read.split(',').map(&:to_i)

def calc(init, days)
  list = {}
  9.times { |i| list[i] = 0 }
  init.each { |i| list[i] += 1 }

  days.times do |day|
    new = list[0]
    list.each do |k, v|
      next if k.zero?

      list[k - 1] = list[k]
    end
    list[8] = new
    list[6] += new
  end

  list.sum { |k, v| v }
end

puts calc(fish, 80)
puts calc(fish, 256)
