class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show add_actor ]

  def show
  end

  def add_actor
    actor = Actor.where(name: params[:actor_name]).limit(1).first
    @movie.actors << actor if not(actor.nil?)

    redirect_to movie_path(@movie)
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end
end