# takes an array of integers as an argument and returns the sum of its elements.
# For an empty array it should return zero
def sum(arg)
    sum = 0
    # if arg is empty, no loop sum
    arg.each { |item|  sum+=item }
    sum
end

# takes an array of integers as an argument and returns the sum of its two largest elements. 
# For an empty array it should return zero. 
# For an array with just one element, it should return that element.

def max_2_sum(arg)
		# the arg is array
	return 0 if arg.empty?
	return arg[0] if arg.length==1
	
	arg.sort!
	arg[-1] + arg[-2]
end


# takes an array of integers and an additional integer, n, as arguments 
# and returns true if any two distinct elements in the array of integers sum to n. 
# An empty array or single element array should both return false. 

def sum_to_n?(arr, n)
   return false if arr.empty? || arr.length==1
   
   arr.combination(2) { |x,y| return true if x+y == n }

   false
end

raise "sum([])!=0" unless sum([])==0
raise "sum([1])!=1" unless sum([1])==1
raise "sum([1,2,3,4])" unless sum([1,2,3,4])==10

raise "max_2_sum[])!=0" unless max_2_sum([])==0
raise "max_2_sum[1])!=1" unless max_2_sum([1])==1
raise "max_2_sum[2,4,1,0])!=6" unless max_2_sum([2,4,1,0])==6

raise "sum_to_n[],0)!=false" unless sum_to_n?([],0)==false
raise "sum_to_n[1],1)!=false" unless sum_to_n?([1],1)==false
raise "sum_to_n[2,4,1,0], 3)!=true" unless sum_to_n?([2,4,1,0],3)==true
