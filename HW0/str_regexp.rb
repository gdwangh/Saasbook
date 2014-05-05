def hello(name)
	"Hello, "+name
end

def starts_with_consonant?(s)

	return (s[/\A[a-z&&[^aeiou]]/i])? TRUE : FALSE

end

def binary_multiple_of_4?(s)
	return (s[/\A[01]*1[01]*0{2}\Z/])? TRUE : FALSE
end

