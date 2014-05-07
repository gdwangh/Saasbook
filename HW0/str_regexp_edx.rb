# takes a string representing a name and returns the string "Hello, " concatenated with the name. 

def hello(name)
	"Hello, "+name
end

#takes a string and returns true if it starts with a consonant and false otherwise. 
# (For our purposes, a consonant is any letter other than A, E, I, O, U.) 
# NOTE: be sure it works for both upper and lower case and for nonletters! 

def starts_with_consonant?(s)

	s[/\A[a-z&&[^aeiou]]/i] ? TRUE : FALSE

end


#takes a string and returns true if the string represents a binary number that is a multiple of 4. 
# NOTE: be sure it returns false if the string is not a valid binary number!

def binary_multiple_of_4?(s)
 	s[/\A[01]+\Z/]  && (s.to_i(2)%4==0) ? TRUE : FALSE
end

