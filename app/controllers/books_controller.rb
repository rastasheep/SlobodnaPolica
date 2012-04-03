class BooksController < ApplicationController
  def index
  	@book = Book.new
  	@books = Book.all
  end

  def show
	@book = Book.find params[:id] 	
  end

  def create
  	Book.create params[:book]
  	redirect_to books_path
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