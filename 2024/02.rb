#!/usr/bin/env ruby
# frozen_string_literal: true

reports = []
$stdin.each_line(chomp: true) do |line|
  reports << line.split(' ').map(&:to_i)
end

def check_levels(levels, n)
  prev = levels.first
  levels[1..-1].each do |level|
    return false unless ((level - prev) * n).between?(1, 3)

    prev = level
  end

  true
end

safe_total = 0
reports.each do |levels|
  safe_total += 1 if check_levels(levels, 1) || check_levels(levels, -1)
end
puts(safe_total)

safe_total = 0
reports.each do |levels|
  if check_levels(levels, 1) || check_levels(levels, -1)
    safe_total += 1
    next
  end

  levels.size.times do |i|
    l = levels.dup
    l.delete_at(i)
    if check_levels(l, 1) || check_levels(l, -1)
      safe_total += 1
      break
    end
  end
end
puts(safe_total)
