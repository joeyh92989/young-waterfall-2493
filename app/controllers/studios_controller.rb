class StudiosController < ApplicationController

  def show
    @studio = Studio.find(params[:id])
    @movies = @studio.movies
    @actors = ActorsMovies.all
    # binding.pry
  end

end
