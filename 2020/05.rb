#!/usr/bin/env ruby

ROW_MAX = 127
COL_MAX = 7

input = `xclip -o`

lines = input.lines(chomp: true)

seats = []
lines.each do |line|
  row = col = 0
  row_l = row_m = 0
  row_h = ROW_MAX
  line[0..6].each_char do |char|
    row_m = (row_h - row_l) / 2 + row_l
    if char == "F"
      row = row_h = row_m
    elsif char == "B"
      row = row_l = row_m + 1
    end
  end

  col_l = col_m = 0
  col_h = COL_MAX
  line[7..9].each_char do |char|
    col_m = (col_h - col_l) / 2 + col_l
    if char == "L"
      col = col_h = col_m
    elsif char == "R"
      col = col_l = col_m + 1
    end
  end

  seats << row * 8 + col
end
puts "Answer1: #{seats.max}"

list = (0..(ROW_MAX * (COL_MAX + 1))).to_a
seats = list.reject {|id| seats.include?(id)}

seats.reject! {|id| seats.include?(id + 1) || seats.include?(id - 1)}
puts "Answer2: #{seats.first}"

