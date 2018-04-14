class SessionsController < ApplicationController
  def create

    @user = User.find_by name: params[:user][:name]

    if @user
      session[:user_id] = @user.id
      flash[:success] = "Successfully logged in as existing user #{@user.name}"
      redirect_to root_path
    else
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        flash[:success] = "Successfully created new user #{@user.name} with ID #{@user.id}"
        redirect_to root_path
      else
        flash[:alert] = "A problem occurred: Could not log in"
        render :new
      end
    end
  end

  def new
    @user = User.new
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Successfully logged out"
    redirect_to root_path
  end


  private

  def user_params
    params.require(:user).permit(:name)
  end

end
