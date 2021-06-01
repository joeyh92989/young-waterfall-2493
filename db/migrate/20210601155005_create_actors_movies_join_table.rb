class CreateActorsMoviesJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :actors, :movies do |t|
      t.index :movie_id
      t.index :actor_id
    end
  end
end
