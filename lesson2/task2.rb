# Заполнить массив числами от 10 до 100 с шагом 5
# 20.08.2016

array = []
index = 10

while index <= 100 do 
  array << index
  index += 5
end
puts "#{array}"