class WorksController < ApplicationController
  def index
    @works_movies = Work.where(category: "movie")
    @works_books = Work.where(category: "book")
    @works_albums = Work.where(category: "album")
  end

  def show
    @work = Work.find_by(id: params[:id])
  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy
  end

end
