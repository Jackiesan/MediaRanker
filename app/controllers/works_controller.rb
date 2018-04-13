class WorksController < ApplicationController

  def main
    @works_movies = Work.where(category: "movie").order_by_vote
    @works_books = Work.where(category: "book").order_by_vote
    @works_albums = Work.where(category: "album").order_by_vote
    @spotlight = Work.spotlight
  end

  def index
    @works_movies = Work.where(category: "movie").order_by_vote
    @works_books = Work.where(category: "book").order_by_vote
    @works_albums = Work.where(category: "album").order_by_vote
  end

  def show
    work = Work.find_by(id: params[:id])
    if work == nil
      flash[:alert] = "Work does not exist"
      redirect_to works_path
    else
      @work = work
    end
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      flash[:success] = "#{@work.title} saved"
      redirect_to works_path
    else
      flash[:alert] = "Could not create #{@work.category}"
      render :new
    end
  end

  def edit
    @work = Work.find_by(id: params[:id])
  end

  def update
    @work = Work.find_by(id: params[:id])
    if !@work.nil?
      if @work.update(work_params)
        flash[:success] = "#{@work.title} updated"
        redirect_to work_path(@work.id)
      else
        flash[:alert] = "A problem occurred: Could not update #{@work.category}"

        render :edit
      end
    else
      redirect_to works_path
    end
  end

  def destroy
    @work = Work.find_by(id: params[:id])
    begin
      if @work.destroy
        flash[:success] = "DELETED"
        redirect_to works_path

      end
    rescue
      flash[:alert] = "Book does not exist"
    end
  end

  def upvote
    user = User.find_by(id: session[:user_id])

    @vote = Vote.new
    @vote.user = user
    @vote.work = Work.find_by(id: params[:id])
    if @vote.save
      flash[:success] = "Successfully upvoted!"

      redirect_back(fallback_location: root_path)
    elsif @user != nil
      flash[:alert] = "Could not upvote"

      flash[:notice] = @vote.errors.first[1]

      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "Must be logged in"
      redirect_back(fallback_location: root_path)    end
    end

    private

    def work_params
      params.require(:work).permit(:title, :category, :creator, :publication_year, :description)
    end

  end
