def hello(name)
	puts "Hello, "+name
end

def starts_with_consonant?(s)

	if s =~ /\A[AEIOU]/i
		return TRUE
	else
		return FALSE
	end
end

def binary_multiple_of_4?(s)
	if s =~ \[01]*1[01]*0{2}$\ 
		return TRUE
	else
		return FALSE
	end
end
