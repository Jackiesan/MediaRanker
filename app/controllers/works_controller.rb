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
    @work = Work.new
    if @work.save
      redirect_to works_path
    else
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
        redirect_to work_path
      else
        render :edit
      end
    else
      redirect_to works_path
    end
  end

  def destroy
    @work = Work.find_by(id: params[:id])
    if @work.destroy
      redirect_to works_path
    else
      render :new
    end
  end

  private

  def work_params
    params.require(:task).permit(:title, :category, :creator, :publication_year, :description)
  end

end
