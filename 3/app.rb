require 'pry'
def slope(x, y)
  posx = 0
  posy = 0
  count = 0
  lines = File.readlines('data.txt').map(&:chomp)
  length = lines.first.size
  while(posy < lines.size) do
    count += 1 if lines[posy][posx] == '#'
    if posx + x >= length
      posx = posx + x - length
    else
      posx += x
    end
    posy += y
  end
  count
end

puts slope(3, 1) * slope(1, 1) * slope(5, 1) * slope(7, 1) * slope(1, 2)
