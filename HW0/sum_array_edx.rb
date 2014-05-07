# takes an array of integers as an argument and returns the sum of its elements.
# For an empty array it should return zero
def sum(arg)
	sum=0
	if tmp=Array.try_convert(arg)
		# The arg is array
		arg.each { |item|  sum+=item }
	end

	sum
end

# takes an array of integers as an argument and returns the sum of its two largest elements. 
# For an empty array it should return zero. 
# For an array with just one element, it should return that element.

def max_2_sum(arg)
	sum=0

	if tmp=Array.try_convert(arg)
		# the arg is array
		case arg.length
		when 0
			sum=0
		when 1
			sum=arg[0]
	    else
			arg.sort!
			sum=arg[-1] + arg[-2]
        end
	end

	sum
end


# takes an array of integers and an additional integer, n, as arguments 
# and returns true if any two distinct elements in the array of integers sum to n. 
# An empty array or single element array should both return false. 

def sum_to_n?(arr, n)
   sum_n=FALSE
   
   arr.combination(2) { |x,y| if x+y == n
            						sum_n=TRUE
            						break
					           end
				    }
   sum_n
end

