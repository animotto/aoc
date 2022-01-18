#!/usr/bin/env ruby

crabs = $stdin.readline.split(',').map(&:to_i)

positions = {}
crabs.length.times do |position|
  fuel = 0
  crabs.each do |crab|
    fuel += (crab - position).abs
  end
  positions[position] = fuel
end

min = positions.min_by { |k, v| v }
puts min.to_a[1]

positions = {}
crabs.length.times do |position|
  fuel = 0
  crabs.each do |crab|
    cost = (crab - position).abs
    fuel += (1..cost).inject(0) { |s, n| s += n }
  end
  positions[position] = fuel
end

min = positions.min_by { |k, v| v }
puts min.to_a[1]
