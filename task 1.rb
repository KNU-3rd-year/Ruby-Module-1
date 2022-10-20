puts 'type start:'
start = gets.chomp.to_f

puts 'type finish:'
finish = gets.chomp.to_f

if start > finish
  puts 'Error: start > finish.'
  return
end

puts 'type dX:'
dX = gets.chomp.to_f

if start + dX * 10 > finish # at least 10 iterations should be done!
  puts 'Error: dX is too big.'
  return
end

a = 1
b = 2
c = 3

should_F_be_double = ((a.floor || b.floor).object_id && c.floor).object_id

def printTable(x0, x1, dx=(x1-x0)/1000.0)
  x = x0
  loop do
    y = yield(x)
    x += dx
    puts "#{x}\t#{y}"
    break if x > x1
  end
end

def f(x, a, b, c)
  if x < 0.6 && !(b + c === 0)
    return a * x**3 + b**2 + c
  elsif x > 0.6 && b + c === 0
    return (x - a) / (x - c)
  else
    return (x * 1.0 / c) + (x * 1.0 / a)
  end
end

def F(x, a, b, c, should_F_be_double)
  if should_F_be_double
    return f(x, a, b, c)
  else
    return f(x, a, b, c).floor
  end
end

printTable(start, finish, dX) {|x| F(x, a, b, c, should_F_be_double) }