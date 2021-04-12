require 'rails_helper'

RSpec.describe 'movie show page' do
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
  it 'lists all the fields ' do

    visit  "/movies/#{@movie_1.id}"

    expect(page).to have_content(@movie_1.title)
    expect(page).to have_content(@movie_1.creation_year)
    expect(page).to have_content(@movie_1.genre)
    
    within "#actor-#{@actor_1.id}" do
      expect(page).to have_content(@actor_1.name)
    end

    within "#actor-#{@actor_2.id}" do
      expect(page).to have_content(@actor_2.name)
    end
  end 
    it 'only shows actors in the movie' do
      visit  "/movies/#{@movie_1.id}"

      expect(page).to_not have_content(@actor_3.name)
    end
    it 'can add an actor' do

      visit "/movies/#{@movie_1.id}"
      
      expect(page).to have_content("Add Actor")
      fill_in 'name', with: "#{@actor_3.name}"
      click_on("Add")

      within "#actor-#{@actor_3.id}" do
        expect(page).to have_content(@actor_3.name)
      end

  end
end