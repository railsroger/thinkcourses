puts "Квадратное уравнение"
sleep 1

puts "Введите числовой коэффициент a:"
a = gets.chomp.to_f

puts "Введите числовой коэффициент b:"
b = gets.chomp.to_f

puts "Введите числовой коэффициент c:"
c = gets.chomp.to_f

d = b ** 2 - 4 * a * c

if d > 0
	x1 = (-b + Math.sqrt(d)) / (2 * a)
	x2 = (-b - Math.sqrt(d)) / (2 * a)
	puts "Дискриминант #{d} и два корня: x1 = #{x1} и x2 = #{x2}"
elsif d = 0
	x = -b / 2 * a
	puts "Дискриминант #{d} и один корень x = #{x}" 
else
	puts "Корней нет. Дискриминант не может быть меньше '0'"
end
	