#Площадь треугольника. Площадь треугольника можно вычилсить, зная его основание (a) и высоту (h)
# по формуле: 1/2*a*h. Программа должна запрашивать основание и высоту треуголиника и 
# возвращать его площадь.
# author - Ilyina Liliya
# date - 16.08.2016
puts "Please enter a"
a = gets.chomp     

puts "Please enter h" 
h = gets.chomp     

S =  0.5 * (a.to_f * h.to_f)

puts "Square  = #{S}"
