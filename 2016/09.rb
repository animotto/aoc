#!/usr/bin/env ruby

def read_data_v1(input)
  output = String.new
  marker = String.new
  i = 0
  while i < input.length
    if marker.empty?
      if input[i] == '('
        marker << input[i]
      else
        output << input[i]
      end

      i += 1
      next
    end

    if marker[-1] != ')'
      marker << input[i]
      i += 1
      next
    end

    m = marker.delete_prefix('(').delete_suffix(')')
    a, b = m.split('x', 2).map(&:to_i)
    b.times { output << input[i..(i + a - 1)] }

    i += a
    marker.clear
  end

  output.length
end

def read_data_v2(input)
  marker = String.new
  length = i = 0
  while i < input.length
    if marker.empty?
      if input[i] == '('
        marker << input[i]
      else
        length += 1
      end

      i += 1
      next
    end

    if marker[-1] != ')'
      marker << input[i]
      i += 1
      next
    end

    m = marker.delete_prefix('(').delete_suffix(')')
    a, b = m.split('x', 2).map(&:to_i)
    if input[i] == '('
      length += read_data_v2(input[i..(i + a - 1)]) * b
    else
      length += a * b
    end

    i += a
    marker.clear
  end

  length
end

input = $stdin.readline.chomp

puts read_data_v1(input)
puts read_data_v2(input)
