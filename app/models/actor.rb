class Actor < ApplicationRecord
  has_many :actor_movies
  has_many :movies, through: :actor_movies

  def self.associated_actors(studio_id)
    Actor.joins(movies: :studio).where("studios.id = studio_id")
  end
  def self.order_age
    order(age: :desc)
  end
end