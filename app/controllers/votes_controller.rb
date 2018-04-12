class VotesController < ApplicationController
  def create
    # @vote = Vote.new
    # @vote.user = User.find(session[:user_id])
    # @vote.work = Work.find(params[:work_id])
    # if @vote.save
    #   redirect_to root_path
    # else
    #   render :create
    # end
  end

  # private
  #
  # def vote_params
  #   return params.require(:vote).permit(:user_id, :work_id)
  # end
end
