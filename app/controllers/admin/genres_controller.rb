class Admin::GenresController < ApplicationController

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path
    end
  end

  def edit
  end

  def update
  end

  private

  def genre_params
    params.require(:genre).permit(:name, :created_at, :updated_at)
  end

end
