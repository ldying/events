class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to "/", notice: "User successfully created"

    else 
      # @user
      flash[:errors] = @user.errors.full_messages
      redirect_to "/"
    # render "index"
    end
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user1 = User.find(params[:id])
    user1.first_name = params[:user][:first_name]
    user1.last_name = params[:user][:last_name]
    user1.email = params[:user][:email]
    user1.location = params[:user][:location]
    user1.state = params[:user][:state]
    if user1.save
      redirect_to "/events"
    else
      flash[:errors] = user1.errors.full_messages
      redirect_to "/users/#{params[:id]}/edit"
    end
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :location, :state, :password, :password_confirmation)
  end
end
