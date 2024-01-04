#!/usr/bin/env ruby
# frozen_string_literal: true

CUBES = {
  'red' => 12,
  'green' => 13,
  'blue' => 14
}.freeze

input = $stdin.readlines

games = []
input.each do |line|
  line.strip!
  possible = true
  tokens_data = line.split(': ')
  tokens_game = tokens_data[0].split(' ')
  game_id = tokens_game[1].to_i
  tokens_data = tokens_data[1].split('; ')
  tokens_data.each do |data|
    tokens_cubes = data.split(', ')
    tokens_cubes.each do |data|
      tokens = data.split(' ')
      if tokens[0].to_i > CUBES[tokens[1]]
        possible = false
        break
      end
    end

    break unless possible
  end

  games << game_id if possible
end

puts(games.sum)

games.clear
cubes = {
  'red' => 0,
  'green' => 0,
  'blue' => 0
}

input.each do |line|
  line.strip!
  cubes.each_key do |cube|
    cubes[cube] = 0
  end

  tokens_data = line.split(': ')
  tokens_game = tokens_data[0].split(' ')
  game_id = tokens_game[1].to_i
  tokens_data = tokens_data[1].split('; ')
  tokens_data.each do |data|
    tokens_cubes = data.split(', ')
    tokens_cubes.each do |data|
      tokens = data.split(' ')
      cubes[tokens[1]] = [cubes[tokens[1]], tokens[0].to_i].max
    end
  end

  games << cubes.values.inject(1, :*)
end

puts(games.sum)
