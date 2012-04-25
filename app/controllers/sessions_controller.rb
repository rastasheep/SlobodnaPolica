class SessionsController < ApplicationController
  before_filter :authorized, :only => :new


def create
	session[:password] = Digest::SHA256.hexdigest(params[:password])
	if admin?
		flash[:success] = "Dobrodosli, ostvarili ste administratorske privilegije"
	else
		flash[:error] = "Pogresna sifra, pokusajte ponovo"  	
	end
	redirect_to root_path
end


def destroy
  reset_session
  flash[:success] = "Uspesno ste se odjavili"
  redirect_to root_path
end
end
