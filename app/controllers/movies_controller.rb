class MoviesController < ApplicationController
  def index
    # @movies = params[:query].present? ? Movie.where(title: params[:query]) : Movie.all
    if params[:query].present? # => .nil?
      @movies = Movie.search(params[:query])
      # @movies = Movie.where('title ILIKE ? OR synopsis ILIKE ?', "%#{params[:query]}%", "%#{params[:query]}%")
      # @movies = Movie.where(title: "#{params[:query]}")
    else
      @movies = Movie.all
    end
  end
end
