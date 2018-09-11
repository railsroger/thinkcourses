puts "Привет, мой друг! Сейчас мы узнаем на сколько ты стройняга."
sleep 2

puts "Как тебя зовут?"
name = gets.chomp

puts "Скажика мне свой рост, пожалуйста?"	
growth = gets.chomp.to_f

ideal_weight = growth - 110

if ideal_weight >= 0
	puts "Дорогой, #{name}! Ваш идеальный вес составляет - #{ideal_weight}  кг."
else
	puts "Ваш вес уже оптимальный, #{name}"	
end

