numbers = File.readlines("data.txt").map(&:to_i)
numbers.each do |num|
  numbers.each do |num2|
    numbers.each do |num3|
      puts num*num2*num3 if num + num2 + num3 == 2020
    end
  end
end
