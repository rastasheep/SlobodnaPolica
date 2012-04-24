module BooksHelper
	def title(page_title)
		content_for (:title ) { page_title }
	end
	def yield_or_default(section, default = "")
		content_for?(section) ? content_for(section) : default
	end
	
	def categories
		@cat = Array.new
		categories = Book.select('distinct categories').collect(&:categories)
		categories = categories.collect{|x| x.split(",")}.flatten!.collect{|x| x.strip.downcase}.uniq!
		@cat=categories.sort!
	end
	def authors
		@auth = Book.select('distinct author').collect(&:author).sort!
	end
end	