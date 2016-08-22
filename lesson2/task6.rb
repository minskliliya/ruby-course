#Сумма покупок. Пользователь вводит поочередно название товара, цену за единицу и кол-во купленного 
#товара (может быть нецелым числом). Пользователь может ввести произвольное кол-во товаров до тех пор,
# пока не введет "стоп" в качестве названия товара. На основе введенных данных требуетеся:
#Заполнить и вывести на экран хеш, ключами которого являются названия товаров, а значением - вложенный хеш, 
#содержащий цену за единицу товара и кол-во купленного товара. Также вывести итоговую сумму за каждый товар.
#Вычислить и вывести на экран итоговую сумму всех покупок в "корзине".

products = {} 

loop do 
  puts "What would you like to by? If you don't need any product, enter stop"
  product = gets.chomp
  break if product == "stop"
  puts "Type a price"
  price = gets.chomp.to_f
  puts "Type a nubmer of the product"
  number = gets.chomp.to_f

  products[product] = {price => number}
end


puts "#{products}"
sum = 0
products.each do |product,value|
  value.each do |price,number|
    sum += price*number
    puts "#{product} costs  = #{price*number}"
  end  
end  

puts "All summa = #{sum}"








  



