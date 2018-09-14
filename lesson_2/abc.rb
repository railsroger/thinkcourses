# 4. Заполнить хеш гласными буквами, где значением будет являтся порядковый номер 
# буквы в алфавите (a - 1).
abc = "абвгдеёжзийклмнопрстуфхцчшщъыьэюя"
vowels = "аеёиоуыэюя"
hash_vowels = {}

vowels.each_char { |vowel| hash_vowels[vowel] = abc.index(vowel) + 1}

print hash_vowels