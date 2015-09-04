include Math
require "set"

module FactorsAndCaching

	# Public method that checks input to determine whether
	# calling polynomial-time or pseudo-polynomial-time
	# algorithm is optimal.
	def self.factor_list_of_integers(input)
	
		running_sum = 0
		input.each do |element|
			running_sum += sqrt(element)
		end
			
		if input.length**2 > running_sum
			puts 'pseudo-polynomial algorithm used'
			return factor_list_pseudo_polynomial(input)
		else
			puts 'polynomial algorithm used'
			return factor_list_polynomial(input)
		end

	end


	private

		# O(n^2)
		def self.factor_list_polynomial(input)

			# Since this is a code challenge, I wanted to try for a one-line solution,
			# even though Ruby doesn't support list comprehensions.  The result was
			# not very readable, but I included it here anyway:
			#
			#return Hash.new{|h,k|
			#								 h[k]=[]}
			#					  .tap{|h|
			#								 input.zip(input.map{|element_i|
			#																		 input.select{|element_j|
			# 																								element_i != element_j && element_i % element_j == 0}})
			#											.each{|k,v|
			# 													h[k] = v }}


			# A much more readable approach:
			output = Hash.new

			input.each do |element_i|
				output[element_i] = []
				input.each do |element_j|
					if element_i % element_j == 0 && element_i != element_j
						output[element_i] << element_j
					end
				end
			end

			return output

		end


		# 0(n*sqrt(max(N)))
		def self.factor_list_pseudo_polynomial(input)

			input_set = Set.new(input)
			output = Hash.new{|h,k| h[k]=[]}

			input.each do |element|
				output[element] = get_valid_factors_of_integer(element,input_set)
			end

			return output

		end


		# Called by factor_list_pseudo_polynomial on one integer
		def self.get_valid_factors_of_integer(n, input_set)

			result = []

			(1..((sqrt(n)).floor)).each do |j|
				if n % j == 0
					# Check that j is a member of the input set and does not equal n
					if input_set.include?(j) && n != j
						result << j
					end
					# Check that n/j is a member of the input set and does not equal n
					if input_set.include?(n/j) && n != n/j && j != n/j
						result << (n/j)
					end
				end
			end

			return result

		end
	
end