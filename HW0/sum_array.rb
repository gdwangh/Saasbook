def sum(arg)
	sum=0
	if tmp=Array.try_convert(arg)
		# The arg is array
		arg.each { |item|  sum+=item }
	end

	sum
end

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

def sum_to_n?(arr, n)
   sum_n=FALSE
   if (arr.length==0 && n==0)
	sum_n=TRUE
   else
	arr.combination(2) { |x,y| if x+y==n 
				     sum_n=TRUE; 
				   end
			   }
   end
 
   sum_n
end
