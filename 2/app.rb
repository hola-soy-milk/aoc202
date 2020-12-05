lines = File.readlines('data.txt')
regex =
total = lines.inject 0 do |count, line|
  pos1, pos2, character, password = line.match(/(\d+)-(\d+) (.): (.*)/).captures
  pos1_char = password[pos1.to_i - 1]
  pos2_char = password[pos2.to_i - 1]
  valid = (pos1_char == character) ^ (pos2_char == character)
  count + (valid ? 1 : 0)
end
puts total
