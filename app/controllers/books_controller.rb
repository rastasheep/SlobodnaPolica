class BooksController < ApplicationController
  def index
  	@books = Book.all
  end

  def new
    @book = Book.new
  end

  def show
	@book = Book.find params[:id] 	
  end

  def create
  	@book = Book.create params[:book]
    if @book.valid?
      redirect_to root_path, :notice => 'Uspeno dodata knjiga!'
    else
      flash[:notice] = 'Doslo je do greske! Popunite obavezna polja.'
      render :new 
    end   
  end

  def edit
  	@book = Book.find params[:id]
  end

  def update
  	book =  Book.find params[:id]
  	if book.update_attributes params[:book]
  		redirect_to books_path, :notice => 'Uspeno izmenjena knjiga!'
  	else
  		redirect_to :back, :notice => 'Doslo je do greske! Popunite obavezna polja.'
  	end		
  end

  def destroy
  	Book.destroy params[:id]
  	redirect_to books_path, :notice => 'Uspeno izbrisana knjiga!'
  end
end