class SessionsController < ApplicationController
  def create
  	user = User.find_by_email(params[:user][:email])
 	if user && user.authenticate(params[:user][:password])
 	  session[:user_id] = user.id
 	  redirect_to "/events"
 	else
      flash[:errors] = ["Invalid Login"]
	  redirect_to '/' 		
 	end
  end

  def destroy
  	session[:user_id] = nil
  	# session.destroy
	redirect_to '/' 		
  end
end
