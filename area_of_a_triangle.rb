puts 'Вычисление площади треугольника.'

puts 'Введите основание а:'
a = gets.chomp.to_f

puts 'Введите высоту h:'
h = gets.chomp.to_f

if a > 0 && h > 0
  area_triangle = 0.5 * a * h
  puts "Площадь треугольника равна #{area_triangle}"
else
  puts 'Вводить 0 или отрицательные числа нельзя!'
end
