class UsersController < ApplicationController
  before_action :find_user

  def show
  end

  def index
    @users = User.all
  end
end
