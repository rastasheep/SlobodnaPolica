class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :all
  helper_method :admin?

protected

	def admin?
	  session[:password] == "d93c22dc148e2e86051d4315e4007e25d13b221052182fca5e0d56d86d62b6a9"
	end

	def authorize
	  unless admin?
	    flash[:error] = "Zabranjen pristup, potrebne administratorske privilegije"
	    redirect_to root_path
	    false
	  end
	end

	def authorized
	  if admin?
	    flash[:error] = "Vec ste prijavljeni, imate potrebne administratorske privilegije"
	    redirect_to root_path
	    false
	  end
	end
end
