puts 'Прямоугольный треугольник'
sleep 1

puts 'Введите значение для стороны треугольника a:'
a = gets.chomp.to_f

puts 'Введите значение для стороны треугольника b:'
b = gets.chomp.to_f

puts 'Введите значение для стороны треугольника c:'
c = gets.chomp.to_f

# Determination of the largest side
if (a > b) && (a > c)
	side1 = b
	side2 = c
	max_side = a
elsif (b > a) && (b > c)
	side1 = a
	side2 = c
	max_side = b
else
	side1 = a
	side2 = b 
	max_side = c 
end

if max_side ** 2 == side1 ** 2 + side2 ** 2
	puts 'Треугольник прямоугольный'
else 
	puts 'Треугольник не прямоугольный'
end 

#Defining the type of triangle
if a != b && a != c && b != c
	puts 'Треугольник разносторонний'
elsif a == b && b == c && a == c
	puts 'Треугольник равносторонний'
else
	puts 'Треугольник равнобедренный'
end
