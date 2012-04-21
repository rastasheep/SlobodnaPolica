class BooksController < ApplicationController
  def index
    if !params[:search].blank?
  	 books = Book.search_by_book( params[:search] )
      if books.empty?
        flash[:info] = 'Nema rezultata pretrage. Molimo vas pokusajte ponovo.'
        redirect_to root_path
       else
        @books = books
      end
    else
      @books = Book.all
    end
  end

  def show
    @book = Book.find params[:id]   
  end

  def new
    @book = Book.new
  end

  def create
  	@book = Book.create params[:book]
    if @book.valid?
      flash[:success] = 'Uspeno dodata knjiga!'
      redirect_to root_path
    else
      flash[:error] = 'Doslo je do greske! Popunite obavezna polja.'
      render :new 
    end   
  end

  def edit
  	@book = Book.find params[:id]
  end

  def update
  	book =  Book.find params[:id]
  	if book.update_attributes params[:book]
      flash[:success] = 'Uspeno izmenjena knjiga!'
  		redirect_to books_path
  	else
  		flash[:error] = 'Doslo je do greske! Popunite obavezna polja.'
      redirect_to :back
  	end		
  end

  def destroy
  	Book.destroy params[:id]
    flash[:success] = 'Uspeno izbrisana knjiga!'
  	redirect_to books_path
  end
end