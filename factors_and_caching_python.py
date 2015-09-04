from math import floor, sqrt
import time

# Public method that checks input to determine whether calling
# polynomial-time or pseudo-polynomial-time algorithm is
# optimal
def factor_list_of_integers(input):

    running_sum = 0
    for element in input:
        running_sum += sqrt(element)
        
    if len(input)**2 > running_sum:
        print('pseudo-polynomial algorithm used')
        return _factor_list_pseudo_polynomial(input)
    else:
        print('polynomial algorithm used')
        return _factor_list_polynomial(input)

# O(n^2)
def _factor_list_polynomial(input):
    
    # Since this is a code challenge, I used the one-line solution, although
    # readability is sacrificed if the code is to conform to the PEP8 line limit.
    return dict(zip(input, [[el_j for el_j in input
                                    if el_i != el_j and el_i % el_j == 0]
                                    for el_i in input]))

# O(n*sqrt(max(N)))
def _factor_list_pseudo_polynomial(input):
    
    input_set = set(input)
    output = dict.fromkeys(input, [])
    for el in input:
        output[el] = _get_valid_factors_of_integer(el, input_set)
        
    return output
    
# Called by factor_list_pseudo_polynomial on one integer
def _get_valid_factors_of_integer(n, input_set):
    
    result = []
    
    for j in range(1, floor(sqrt(n)+1)):
        if n % j == 0:
            if j in input_set and n != j:
                result.append(j)
            if n/j in input_set and n != n/j and j != n/j:
                result.append(int(n/j))
                    
    return result
    


    
    
