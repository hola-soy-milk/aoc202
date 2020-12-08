original_ops = File.read('data.txt').split("\n")

def run(ops)
  index = 0
  acc = 0

  done = []

  while index < ops.size
    return "ERR" if done.include? index
    op, arg = ops[index].split(' ')
    arg = arg.to_i

    done << index

    if op == 'acc'
      acc += arg
    elsif op == 'jmp'
      index += arg-1
    end
    index += 1
  end

  acc
end

original_ops.each_with_index do |_, index|
  clone = original_ops.map(&:clone)

  instruction = clone[index].split(' ').first

  if instruction == 'jmp'
    clone[index].gsub!("jmp", "nop")
  elsif instruction == 'nop'
    clone[index].gsub!("nop", "jmp")
  end

  acc = run(clone)

  if acc != 'ERR'
    puts acc
    break
  end
end
