puts 'Прямоугольный треугольник'

puts 'Введите значение для стороны треугольника a:'
a = gets.chomp.to_f

puts 'Введите значение для стороны треугольника b:'
b = gets.chomp.to_f

puts 'Введите значение для стороны треугольника c:'
c = gets.chomp.to_f

# Determination of the largest side
arr = [a, b, c]
side_max = arr.max
side_min = arr.min(2)

if side_max**2 == side_min[0]**2 + side_min[1]**2
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
