#!/usr/bin/env ruby

input = `xclip -o`

passports = input.lines("\n\n", chomp: true)

REQUIRED = [
  "byr", "iyr", "eyr",
  "hgt", "hcl", "ecl",
  "pid",
]

counter = 0
passports.each do |passport|
  data = passport.gsub("\n", " ").split(" ")
  fields = data.map {|d| d.split(":")[0]}
  counter += 1 if REQUIRED.all? {|v| fields.include?(v)}
end
puts "Answer1: #{counter}"

counter = 0
passports.each do |passport|
  data = passport.gsub("\n", " ").split(" ")
  fields = {}
  data.each do |d|
    f = d.split(":")
    fields[f[0]] = f[1]
  end
  next unless REQUIRED.all? {|v| fields.keys.include?(v)}

  m = fields["byr"].match(/^(\d{4})$/)
  next unless m && m[1].to_i >= 1920 && m[1].to_i <= 2002
  m = fields["iyr"].match(/^(\d{4})$/)
  next unless m && m[1].to_i >= 2010 && m[1].to_i <= 2020
  m = fields["eyr"].match(/^(\d{4})$/)
  next unless m && m[1].to_i >= 2020 && m[1].to_i <= 2030
  m = fields["hgt"].match(/^(\d+)(cm|in)$/)
  next unless m && ((m[2] == "cm" && m[1].to_i >= 150 && m[1].to_i <= 193) || (m[2] == "in" && m[1].to_i >= 59 && m[1].to_i <= 76))
  m = fields["hcl"].match(/^#[\da-f]{6}$/)
  next unless m
  m = fields["ecl"].match(/^(amb|blu|brn|gry|grn|hzl|oth)$/)
  next unless m
  m = fields["pid"].match(/^\d{9}$/)
  next unless m

  counter += 1
end
puts "Answer2: #{counter}"

