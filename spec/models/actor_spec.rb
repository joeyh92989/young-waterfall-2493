require 'rails_helper'

RSpec.describe Actor do
  describe 'relationships' do
    it {should have_many :actor_movies}
    it { should have_many(:movies).through(:actor_movies) }
  end
  describe '::class_methods'
    before(:each) do
      @studio_1 = Studio.create!(name: "Joey studio", location: "Denver")
      @movie_1= @studio_1.movies.create!(
        title: "avp",
        creation_year: 1999,
        genre: "sci-fi"
      )
      @actor_1= Actor.create!(name: "Harrison", age: 55, currently_working: true)
      @actor_2= Actor.create!(name: "Ford", age: 38, currently_working: false)
      @actor_3 =Actor.create!(name: "Luke", age: 45, currently_working: false)
      ActorMovie.create!(actor: @actor_1, movie: @movie_1)
      ActorMovie.create!(actor: @actor_2, movie: @movie_1)
    end
    it 'can return associated actors' do
      expect(Actor.associated_actors(@studio_1.id)).to eq([@actor_1,@actor_2])
    end

    it 'can order actors by age' do
    
    expect(Actor.order_age).to eq([@actor_1, @actor_3,@actor_2])
  end
end
