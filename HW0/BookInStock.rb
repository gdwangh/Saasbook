class BookInStock
	attr_accessor :isbn, :price

	def initialize(isbn, price)
	  raise ArgumentError.new() if isbn.empty?() || (price<=0)
	  @isbn = isbn
	  @price = price
	end

	def price_as_string
	  "$%.2f" % @price
	end
	  
end