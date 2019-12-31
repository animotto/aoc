#!/usr/bin/env ruby

def exec(prog)
  i = 0
  while i < prog.size do
    case prog[i]
    when 1
      # puts "[#{prog[i + 3]}] = #{prog[prog[i + 1]]} + #{prog[prog[i + 2]]}"
      prog[prog[i + 3]] = prog[prog[i + 1]] + prog[prog[i + 2]]
      i += 4
    when 2
      # puts "[#{prog[i + 3]}] = #{prog[prog[i + 1]]} * #{prog[prog[i + 2]]}"
      prog[prog[i + 3]] = prog[prog[i + 1]] * prog[prog[i + 2]]
      i += 4
    when 99
      # puts "Program halts at #{i} position"
      break
    else
      puts "Something wrong at #{i} position"
      exit
    end
  end
end

input = `xclip -o`
prog = input.split(",")
prog.map! {|i| i.to_i}

prog1 = prog.dup
prog1[1] = 12
prog1[2] = 2
exec(prog1)
puts "Answer 1: #{prog1[0]}"

prog2 = []
noun = verb = 0
catch :search do
  for n in 0..99 do
    for v in 0..99 do
      prog2 = prog.dup
      prog2[1] = noun = n
      prog2[2] = verb = v
      exec(prog2)
      throw :search if prog2[0] == 19690720
    end
  end
end
puts "Answer 2: #{100 * noun + verb}"
