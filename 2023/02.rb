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
  tokens_data = line.split(': ')
  tokens_game = tokens_data[0].split(' ')
  game = { 
    id: tokens_game[1].to_i,
    cubes: []
  }

  tokens_data = tokens_data[1].split('; ')
  tokens_data.each do |data|
    cubes = {}
    tokens_cubes = data.split(', ')
    tokens_cubes.each do |data|
      tokens = data.split(' ')
      cubes[tokens[1]] = tokens[0].to_i
    end

    game[:cubes] << cubes
  end

  games << game
end

possible_games = []
games.each do |game|
  possible = true
  game[:cubes].each do |cubes|
    cubes.each do |cube, value|
      if value > CUBES[cube]
        possible = false
        break
      end
    end

    break unless possible
  end

  next unless possible

  possible_games << game[:id]
end

puts(possible_games.sum)

possible_games.clear
cubes_max = {
  'red' => 0,
  'green' => 0,
  'blue' => 0
}

games.each do |game|
  cubes_max.each_key do |cube|
    cubes_max[cube] = 0
  end

  game[:cubes].each do |cubes|
    cubes.each do |cube, value|
      cubes_max[cube] = [cubes_max[cube], value].max
    end
  end

  possible_games << cubes_max.values.inject(1, :*)
end

puts(possible_games.sum)
