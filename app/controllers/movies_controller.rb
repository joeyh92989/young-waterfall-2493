class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show ]

  def show
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end
end