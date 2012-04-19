module BooksHelper
	def categories
		ad = Array.new
		categories = Book.select('distinct categories').collect(&:categories)
		for cat in categories
			if cat.nil?
				cat = "Bez kategorije"
			end
			ad<<cat
		end
		return ad.sort!
	end
	def authors
		auths = Book.select('distinct author').collect(&:author)
	end
end
