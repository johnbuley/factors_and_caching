I implemented this solution in both Python and Ruby.

Both accept a collection of distinct integers and return
a hashtable where the set of keys is the set of integers,
and the set of values is the sets of factors for each
key present in the key set excluding the key itself.

factor_list_of_integers(input) is the public method for both,
and runs a quick analysis to determine which factoring
algorithm to call.  This is described in the discussion.