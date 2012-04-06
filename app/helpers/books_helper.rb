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
end
