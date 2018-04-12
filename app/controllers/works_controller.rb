class WorksController < ApplicationController

  def main
    @works_movies = Work.where(category: "movie")
    @works_books = Work.where(category: "book")
    @works_albums = Work.where(category: "album")
  end

  def index
    @works_movies = Work.where(category: "movie")
    @works_books = Work.where(category: "book")
    @works_albums = Work.where(category: "album")
  end

  def show
    @work = Work.find_by(id: params[:id])
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
      flash.now[:alert] = @work.errors
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
        flash[:alert] = @work.errors
        render :edit
      end
    else
      redirect_to works_path
    end
  end

  def destroy
    @work = Work.find_by(id: params[:id])
    @work.destroy
    redirect_to works_path
  end

  def upvote
    @vote = Vote.new
    @vote.user = User.find(session[:user_id])
    @vote.work = Work.find_by(id: params[:id])
    if @vote.save
      redirect_back(fallback_location: root_path)
    else
    end
  end

  private

  def work_params
    params.require(:work).permit(:title, :category, :creator, :publication_year, :description)
  end

end
