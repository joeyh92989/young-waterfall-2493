class MoviesController < ApplicationController

  def show
    @movie = Movie.find(params[:id])
    @actors = Actor.search(params[:actor_name])
    @actors_movies = ActorsMovies.where()
  end

  def add_actor
    @movie = Movie.find(params[:id])
    @actor = Actor.find(params[:actor_id])
    ActorsMovies.create!(movie: @movie, actor: @actor)
    redirect_to "movies/#{movie.id}"
  end

end
