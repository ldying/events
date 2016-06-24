class EventsController < ApplicationController
  def index
    @events_in_state = Event.where(state: current_user.state).where("date >= ?", Date.today)
    @events_out_state = Event.where.not(state: current_user.state).where("date >= ?", Date.today)
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
  end

  def create
    event = Event.new(event_params)
    if event.save
      redirect_to "/events/#{Event.last.id}", notice: "Event successfully created"

    else 
      flash[:errors] = event.errors.full_messages
      redirect_to "/events"
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    event1 = Event.find(params[:id])
    event1.name = params[:event][:name]
    event1.date = params[:event][:date]
    event1.location = params[:event][:location]
    event1.state = params[:event][:state]
    if event1.save
      redirect_to "/events/#{event1.id}"
    else
      flash[:errors] = event1.errors.full_messages
      redirect_to "/events/#{params[:id]}/edit"
    end
  end

  def destroy
    event = Event.find(params[:id])

    event.destroy if event.user == current_user

    redirect_to "/events"
  
  end

  private
  def event_params
    params.require(:event).permit(:name, :date, :location, :state).merge(user: current_user)
  end
end
