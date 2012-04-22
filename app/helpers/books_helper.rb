module BooksHelper
	def categories
		@cat = Array.new
		categories = Book.select('distinct categories').collect(&:categories)
		for category in categories
			if category.nil?
				category = "Bez kategorije"
			end
			@cat<<category
		end
		@cat.sort!
	end
	def authors
		@auth = Book.select('distinct author').collect(&:author)
	end
end
