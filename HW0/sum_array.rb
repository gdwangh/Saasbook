def sum(arg)
	if tmp=Array.try_convert(arg)
		# The arg is array
		sum=0
		arg.each { |item|  sum+=item }
		return sum
	else
		return 0
	end
end

def max_2_sum(arg)
	if tmp=Array.try_convert(arg)
		# the arg is array
		if arg.length==0
			return 0
		else
		  if arg.length==1
			return arg[0]
	          else
			arg.sort!
			return arg[-1] + arg[-2]
		  end
                end
	else
		return 0
	end
end

def sum_to_n?(arr, n)
   if (arr.length==0 && n==0)
	return TRUE
   else
	arr.combination(2) { |x,y| if x+y==n 
					return TRUE
				   end
			    }
   end
 
   return FALSE
end





	