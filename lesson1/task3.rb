#Прямоугольный треугольник. Программа запрашивает у пользователя 3 стороны треугольника и определяет,
#является ли треугольник прямоугольным, используя теорему Пифагора (www-formula.ru) и выводит результат
#на экран. Также, если треугольник является при этом равнобедренным (т.е. у него равны любые 2 стороны),
#то дополнительно выводится информация о том, что треугольник еще и равнобедренный.
# author - Ilyina Liliya
# date - 16.08.2016
puts "Please enter the first side  a ="
a = Float(gets.chomp)     

puts "Please enter the second side b =" 
b = Float(gets.chomp)     

puts "Please enter the third side с =" 
c = Float(gets.chomp)     

max = a
if b > max 
	max = b
	if c > max 
		max = c
	end	
end

if max**2 == (a**2 + b**2) && ( a == b || b == c || a == c)
	puts "it is rectangular and isosceles"
elsif  (a == b  && a == c) 
    puts "it is equilateral and isosceles"
else
	puts "it is rectangular"
end    	

