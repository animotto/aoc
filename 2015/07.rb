#!/usr/bin/env ruby

# frozen_string_literal: true

def get_wire(wires, wire_id)
  wire = wires[wire_id]

  input1 = wire[:value1]
  if input1.nil?
    input1 = wire[:input1] =~ /^\d+$/ ? wire[:input1].to_i : get_wire(wires, wire[:input1])
    wire[:value1] = input1
  end

  input2 = wire[:value2]
  if input2.nil? && !wire[:input2].nil?
    input2 = wire[:input2] =~ /^\d+$/ ? wire[:input2].to_i : get_wire(wires, wire[:input2])
    wire[:value2] = input2
  end

  case wire[:gate]
  when 'SET'
    return input1
  when 'NOT'
    return ~input1
  when 'AND'
    return input1 & input2
  when 'OR'
    return input1 | input2
  when 'LSHIFT'
    return input1 << input2
  when 'RSHIFT'
    return input1 >> input2
  end
end

wires = {}
$stdin.readlines.each do |line|
  tokens = line.chomp.split(' ')
  wire_id = tokens.last
  case tokens.index('->')
  when 1
    wires[wire_id] = {
      gate: 'SET',
      input1: tokens[0]
    }
  when 2
    wires[wire_id] = {
      gate: tokens[0],
      input1: tokens[1]
    }
  when 3
    wires[wire_id] = {
      gate: tokens[1],
      input1: tokens[0],
      input2: tokens[2]
    }
  end
end

answer1 = get_wire(wires, 'a')
puts "Answer1: #{answer1}"

wires.each do |k, v|
  v.delete(:value1)
  v.delete(:value2)
end
wires['b'][:value1] = answer1
answer2 = get_wire(wires, 'a')
puts "Answer2: #{answer2}"
