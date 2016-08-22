# Заполнить хеш гласными буквами, где значением будет 
# являтся порядковый номер буквы в алфавите (a - 1).

hash = {}

all_letters = ('a'..'z')
all_vowels = ["a", "e", "i", "o", "u", "y"]

index = 0

all_letters.to_a.each do |value|
  if all_vowels.include?(value)
    hash[value] = index
  end
  index = index + 1
end 

puts "#{hash}"