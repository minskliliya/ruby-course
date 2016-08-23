# Заполнить хеш гласными буквами, где значением будет 
# являтся порядковый номер буквы в алфавите (a - 1).

hash = {}

all_letters = ('a'..'z')
all_vowels = ["a", "e", "i", "o", "u", "y"]

index = 0

all_letters.each_with_index do |letter, index|
  hash[letter] = index if all_vowels.include?(letter)
end 

puts hash