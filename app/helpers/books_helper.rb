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
		@auth = Book.select('distinct author').collect(&:author).sort!
	end

	def title(page_title)
		content_for (:title ) { page_title }
	end
	def yield_or_default(section, default = "")
		content_for?(section) ? content_for(section) : default
	end
end	
