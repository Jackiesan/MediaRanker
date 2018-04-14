class UsersController < ApplicationController
  before_action :find_user

  def show
    @user = User.find_by(id: params[:id])
  end

  def index
    @users = User.all
  end
end
