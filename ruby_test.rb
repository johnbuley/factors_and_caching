$LOAD_PATH << '.'

require "./FactorsAndCaching"

puts
input = [10,5,2,20]
puts "Input: #{input}"
puts FactorsAndCaching.factor_list_of_integers(input) 

puts
input = [100,50,20,200]
puts "Input: #{input}"
puts FactorsAndCaching.factor_list_of_integers(input)