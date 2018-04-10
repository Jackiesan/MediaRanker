class WorksController < ApplicationController
  def main
    @works = Work.all
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
    @work = Work.new
    if @work.save
      redirect_to works_path
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy
  end

end
