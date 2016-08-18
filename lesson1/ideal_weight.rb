# Идеальный вес. Программа запрашивает у пользователя имя и рост и выводит идеальный вес по формуле <рост> - 110, 
# после чего выводит результат пользователю на экран с обращением по имени. Если идеальный вес получается 
# отрицательным, то выводится строка "Ваш вес уже оптимальный"
# author - Ilyina Liliya
# date - 16.08.2016

puts "Please enter you first name"
name = gets.chomp

puts "Please enter your height" 
#height = gets.chomp 
height = gets.chomp     

ideal_weight = height.to_f - 110

if ideal_weight > 0
	puts "Hello #{name},  your ideal weight is #{ideal_weight}"
else 
	puts "#{name}, your weigth is optimum"
end
