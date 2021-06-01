require 'rails_helper'

RSpec.describe 'The show page for a studio,' do
  before :all do
    @studio = FactoryBot.create(:studio)
    @movie_1 = FactoryBot.create(:movie, studio: @studio)
    @movie_2 = FactoryBot.create(:movie, studio: @studio)
    @movie_3 = FactoryBot.create(:movie, studio: @studio)

    @actor_1 = FactoryBot.create(:actor, currently_working: false)
    @actor_2 = FactoryBot.create(:actor, age: 18)
    @actor_3 = FactoryBot.create(:actor, age: 22)
    @actor_4 = FactoryBot.create(:actor, age: 37)

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
    it 'shows no duplicates' do
      within '#actors-list' do
        expect(page).to have_content(@actor_2.name, count: 1)
        expect(page).to have_content(@actor_3.name, count: 1)
        expect(page).to have_content(@actor_4.name, count: 1)
      end
    end

    it 'are ordered by age oldest to youngest' do
      within '#actors-list' do
        expect(@actor_4.name).to appear_before(@actor_3.name, only_text: true)
      end
    end
    
    it 'only shows currently working actors' do
      within '#actors-list' do
        expect(page).not_to have_content(@actor_1.name)
      end
    end
  end
end