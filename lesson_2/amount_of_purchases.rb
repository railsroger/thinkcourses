# 6. Сумма покупок.
products = {}

puts 'Введите название товара:'
product_name = gets.chomp

while product_name != "stop"
  puts 'Введите цену товара:'
  product_price = gets.chomp.to_f

  puts 'Введите количество товара:'
  product_count = gets.chomp.to_f

  products[product_name] = { price: product_price, count: product_count }

  puts 'Введите название товара:'
  product_name = gets.chomp
end

puts products

total_sum = 0

products.each do |name, v|
  total_price = v[:price] * v[:count]
  total_sum += total_price
  puts "#{name} = #{total_price}"
end
puts "Total price: #{total_sum}"