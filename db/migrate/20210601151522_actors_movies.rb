class ActorsMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :actors_movies do |t|
      t.belongs_to :actor, index: true, foreign_key: true
      t.belongs_to :movie, index: true, foreign_key: true
    end
  end
end
