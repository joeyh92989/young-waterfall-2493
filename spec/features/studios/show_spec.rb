require 'rails_helper'

RSpec.describe 'The show page for a studio,' do
  before :all do
    @studio = FactoryBot.create(:studio)
    @movie_1 = FactoryBot.create(:movie, studio: @studio)
    @movie_2 = FactoryBot.create(:movie, studio: @studio)
    @movie_3 = FactoryBot.create(:movie, studio: @studio)

    @actor_1 = FactoryBot.create(:actor, currently_working: false)
    @actor_2 = FactoryBot.create(:actor)
    @actor_3 = FactoryBot.create(:actor)
    @actor_4 = FactoryBot.create(:actor)

    @movie_1.actors << @actor_1 << @actor_2
    @movie_2.actors << @actor_2 << @actor_3 << @actor_4
    @movie_3.actors << @actor_1 << @actor_2 << @actor_4
  end

  before :each do
    visit studio_path(@studio)
  end

  it 'shows the studio name and location' do
    within '#studio-stats' do
      expect(page).to have_content(@studio.name)
      expect(page).to have_content(@studio.location)
    end
  end

  it 'shows the list of movie titles' do
    within '#studio-movie-titles' do
      expect(page).to have_content(@movie_1.title)
      expect(page).to have_content(@movie_2.title)
      expect(page).to have_content(@movie_3.title)
    end
  end

  describe 'list of actors,' do
    it 'shows no duplicates'
    it 'are ordered by age oldest to youngest'
    it 'only shows currently working actors'
  end
end