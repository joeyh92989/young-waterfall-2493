class StudiosController < ApplicationController

  def show
    @studio = Studio.find(params[:id])
    @actors = (Actor.associated_actors(params[:id])).order_age
    
  end
end
