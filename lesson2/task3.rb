# Заполнить массив числами фибоначи до 100 
# 22.08.2016

array = [0]

last_num = 1

while last_num < 100 do
  array << last_num
  last_num = array[-1] + array[-2]
end

puts "#{array}"