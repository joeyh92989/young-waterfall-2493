class Actor < ApplicationRecord
  has_and_belongs_to_many :movies

  def self.actors_in_movies_for_studio(studio)
    Actor.where(currently_working: true).joins(:movies).where(movies: {studio_id: studio.id}).distinct.order(age: :desc)
  end
end