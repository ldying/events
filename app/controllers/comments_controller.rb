class CommentsController < ApplicationController
  def create
  	event1 = Event.find(params[:event_id])
  	comment = Comment.new(user: current_user, event: event1, text:params[:text])
  	if comment.save
  	  redirect_to "/events/#{event1.id}", notice: "comment successfully created"
	else 
      flash[:errors] = comment.errors.full_messages
      redirect_to "/events/#{event1.id}"
    end
  end

  def destroy
  end
end
