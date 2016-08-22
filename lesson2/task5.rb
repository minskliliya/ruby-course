#. Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя). 
# Найти порядковый номер даты, начиная отсчет с начала года. Учесть, что год может быть 
#високосным. (Запрещено использовать встроенные в ruby методы для этого вроде
# Date#yday или Date#leap?) 

num_days_in_months = [31,28,31,30,31,30,31,31,30,31,30,31]

puts "Enter a nubmer of day"
day = gets.chomp

puts "Enter a month"
month = gets.chomp

puts "Enter a year"
year = gets.chomp

serial_date_nubmer = 0

index = 0
while index < month.to_i-1 
  serial_date_nubmer = serial_date_nubmer + num_days_in_months[index]
  index += 1
end

serial_date_nubmer = serial_date_nubmer + day.to_i

if month.to_i > 2 
  if year.to_i%4 == 0 
    if (year.to_i%100 == 0) && (year.to_i%400 != 0) 
      serial_date_nubmer = serial_date_nubmer 
    else
      serial_date_nubmer += 1
    end    
  end      
end

puts  "The serial number of date  =  #{serial_date_nubmer}"