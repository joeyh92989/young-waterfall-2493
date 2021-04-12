class ActorMoviesController < ApplicationController
  
  def create
    movie= Movie.find(params[:movie_id])
    actor= Actor.find_by(name: :"#{params[:name]}")

    ActorMovie.create!(actor: actor, movie: movie)
    redirect_to "/movies/#{params[:movie_id]}"
  end
end