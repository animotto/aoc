#!/usr/bin/env ruby

input = $stdin.read

ip = 0
input.each_line(chomp: true) do |line|
  seq = []
  n = 0
  line.each_char do |char|
    if char == '[' || char == ']'
      n += 1
      next
    end

    seq[n] = '' if seq[n].nil?
    seq[n] << char
  end

  p1 = p2 = 0
  seq.each_with_index do |s, i|
    s.each_char.with_index do |c, j|
      break if j > s.length - 4
      if c == s[j + 3] && c != s[j + 1] && s[j + 1] == s[j + 2]
        if i.even?
          p1 += 1
        else
          p2 += 1
        end
      end
    end
  end

  ip += 1 if p2.zero? && !p1.zero?
end
puts "Answer1: #{ip}"

ip = 0
input.each_line(chomp: true) do |line|
  seq = []
  n = 0
  line.each_char do |char|
    if char == '[' || char == ']'
      n += 1
      next
    end

    seq[n] = '' if seq[n].nil?
    seq[n] << char
  end

  p1 = []
  p2 = []
  seq.each_with_index do |s, i|
    s.each_char.with_index do |c, j|
      break if j > s.length - 3
      if c == s[j + 2] && c != s[j + 1]
        if i.even?
          p1 << s[j..(j + 2)]
        else
          p2 << s[j..(j + 2)]
        end
      end
    end
  end

  catch :found do
    p1.each do |q1|
      p2.each do |q2|
        if q1[0] == q2[1] && q1[1] == q2[0] && q1[1] == q2[2]
          ip += 1
          throw :found
        end
      end
    end
  end
end
puts "Answer2: #{ip}"
