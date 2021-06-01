class Actor < ApplicationRecord
  # belongs_to :studio
  has_many :actors_movies
  has_many :movies, through: :actors_movies

  def self.search(search_params)
    where("name ILIKE ?", "%#{search_params}%")
  end
end
