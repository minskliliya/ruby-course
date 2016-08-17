# Квадратное уравнение (усложненное задание). Пользователь вводит 3 коэффициента a, b и с.
# Программа вычисляет дискриминант (D) и корни уравнения (x1 и x2, если они есть) и выводит
# значения дискриминанта и корней на экран. При этом возможны следующие варианты:
# Если D > 0, то выводим дискриминант и 2 корня
# Если D = 0, то выводим дискриминант и 1 корень (т.к. они в этом случае равны)
# Если D < 0, то выводим дискриминант и сообщение "Корней нет"

puts "Please enter the first index  a ="
a = Float(gets.chomp)     

puts "Please enter the second index b =" 
b = Float(gets.chomp)     

puts "Please enter the third index с =" 
c = Float(gets.chomp)     

D = b**2-4*a*c 

if D > 0 
  x1 = (-b + Math.sqrt(D))/(2*a) 
  x2 = (-b - Math.sqrt(D))/(2*a) 
  puts "D = #{D} ,  X1 = #{eval(sprintf("%8.10f",x1))} , X2 = #{eval(sprintf("%8.10f",x2))}"
elsif D == 0 
  x12 = (-b)/(2*a)
  puts "D = #{D} ,  X12 = #{eval(sprintf("%8.10f",x12))}"
else 
  puts "D = #{D} ,  No roots"
end  
      



