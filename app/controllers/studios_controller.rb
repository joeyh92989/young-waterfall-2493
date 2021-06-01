class StudiosController < ApplicationController
  before_action :set_studio, only: %i[ show ]

  def show
  end

  private

  def set_studio
    @studio = Studio.find(params[:id])
  end
end