require 'rails_helper'

RSpec.describe 'The show page for a movie,' do

  before :all do
    @studio = FactoryBot.create(:studio)
    @movie = FactoryBot.create(:movie, studio: @studio)

    @actor_1 = FactoryBot.create(:actor)
    @actor_2 = FactoryBot.create(:actor)
    @actor_3 = FactoryBot.create(:actor)

    @movie.actors << @actor_1 << @actor_2 << @actor_3
  end

  before :each do
    visit studio_movie_path(@studio, @movie)
  end

  it 'shows the title, creation year, and genre' do
    expect(page).to have_content(@movie.title)
    expect(page).to have_content(@movie.creation_year)
    expect(page).to have_content(@movie.genre)
  end

  describe 'list of actors,' do
    it 'shows all the actors in the movie' do
      within '#actors-list' do
        expect(page).to have_content(@actor_1.name)
        expect(page).to have_content(@actor_2.name)
        expect(page).to have_content(@actor_3.name)
      end
    end
  end
end