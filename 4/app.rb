require 'pry'
passes = File.read('data.txt').split("\n\n").map { |str| str.gsub("\n", " ") }
required_fields = %w(byr iyr eyr hgt hcl ecl pid)
count = 0
passes.each do |pass|
  next unless required_fields.all? { |field| pass.include?("#{field}:") }
  byr = pass.match(/byr:(\d+)/).captures.first.to_i
  next unless byr.between?(1920, 2002)
  iyr = pass.match(/iyr:(\d+)/).captures.first.to_i
  next unless iyr.between?(2010, 2020)
  eyr = pass.match(/eyr:(\d+)/).captures.first.to_i
  next unless eyr.between?(2020, 2030)
  if pass.match(/hgt:\d+cm/)
    hgt = pass.match(/hgt:(\d+)cm/).captures.first.to_i
    next unless !hgt.nil? && hgt.between?(150, 193)
  elsif pass.match(/hgt:\d+in/)
    hgt = pass.match(/hgt:(\d+)in/).captures.first.to_i
    next unless !hgt.nil? && hgt.between?(59, 76)
  else
    next
  end
  next unless pass.match(/hcl:#[0-9a-f]{6}/)
  next unless pass.match(/ecl:(amb|blu|brn|gry|grn|hzl|oth) /)
  next unless pass.match(/pid:[0-9]{9}/)
  count += 1
end
puts count
