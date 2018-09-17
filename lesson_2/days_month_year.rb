puts 'Введите день:'
day = gets.chomp.to_i

puts 'Введите месяц:'
month = gets.chomp.to_i

puts 'Введите год:'
year = gets.chomp.to_i

month_all = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

month_all.each_with_index { |m, i| day += m if month - 1 > i } 
  if year % 400 == 0 || (year % 4 == 0 && year % 100 != 0)
    day += 1
  end

puts "Порядковый номер даты: #{day}"