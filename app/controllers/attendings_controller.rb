class AttendingsController < ApplicationController
  def create
  	event1 = Event.find(params[:event_id])
  	attending = Attending.new(user: current_user, event: event1)
  	if attending.save
  	  redirect_to "/events", notice: "attending successfully created"
	else 
      flash[:errors] = attending.errors.full_messages
      redirect_to "/events"
    end
  end

  def destroy
  	attending = Attending.find(params[:id])

    if attending.user == current_user
	  attending.destroy 
      redirect_to "/events"
	else
      flash[:errors] = ["Error unjoining event"]
	  redirect_to "/events"
	end 
  end
end
