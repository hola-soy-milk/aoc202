require 'pry'
lines = File.readlines('data.txt').map(&:chomp)
x = 3
y = 1
posx = 0
posy = 0
count = 0
while(posy < lines.size) do
  count += 1 if lines[posy][posx] == '#'
  if posx == lines.first.size
    posx = 3
  elsif posx == lines.first.size - 1
    posx = 2
  elsif posx == lines.first.size - 2
    posx = 1
  elsif posx == lines.first.size - 3
    posx = 0
  else
    posx += x
  end
  posy += y
end
puts count
