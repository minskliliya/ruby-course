# Заполнить массив числами фибоначи до 100 
# 22.08.2016

array = [0]

index = 1

while index < 100 do
  array.push(index)
  index = array[-1] + array[-2]
end

puts "#{array}"