# 3. Заполнить массив числами фибоначчи до 100
fibonacci = [0,1]

loop do
  fib_result = fibonacci[-1] + fibonacci[-2]
  break if fib_result >= 100
  fibonacci << fib_result
end

print fibonacci 