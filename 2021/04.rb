#!/usr/bin/env ruby

numbers = $stdin.readline.split(',').map(&:to_i)
$stdin.readline

input = $stdin.read
boards = []
input.split("\n\n") do |lines|
  board = []
  lines.split("\n") do |line|
    board += line.split(' ').map(&:to_i)
  end
  boards << board
end

score_first = score_last = 0
win_boards = []
numbers.each do |number|
  boards.each_with_index do |board, i|
    j = board.index(number)
    next if j.nil? || win_boards.include?(i)

    boards[i][j] = 0
    5.times do |j|
      if (board[j * 5].zero? && board[j * 5 + 1].zero? \
          && board[j * 5 + 2].zero? && board[j * 5 + 3].zero? \
          && board[j * 5 + 4].zero?) \
        || (board[j].zero? && board[j + 5].zero? \
            && board[j + 5 * 2].zero? && board[j + 5 * 3].zero? \
            && board[j + 5 * 4].zero?)
        win_boards << i
        sum = board.select { |n| !n.zero? }.sum
        score = sum * number
        score_first = score if score_first.zero?
        score_last = score
      end
    end
  end
end

puts score_first
puts score_last
