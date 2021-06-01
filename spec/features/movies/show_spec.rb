require 'rails_helper'

RSpec.describe 'The show page for a movie,' do

  before :all do
    @studio = FactoryBot.create(:studio)
    @movie = FactoryBot.create(:movie, studio: @studio)

    @actor_1 = FactoryBot.create(:actor)
    @actor_2 = FactoryBot.create(:actor)
    @actor_3 = FactoryBot.create(:actor)
    @actor_4 = FactoryBot.create(:actor)

    @movie.actors << @actor_1 << @actor_2 << @actor_3
  end

  before :each do
    visit movie_path(@movie)
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

  describe 'adding actor form,' do
    it 'redirects to the movie show page with the actor that exists in database is added' do
      within '#add-actor-form' do
        fill_in 'actor_name', with: @actor_4.name
        click_button 'Submit'
      end

      current_path.should eq movie_path(@movie)

      within '#actors-list' do
        expect(page).to have_content(@actor_4.name)
      end
    end

    it 'redirects to the movie show page without the actor added if actor does not exist' do
      within '#add-actor-form' do
        fill_in 'actor_name', with: 'Bobby Jones Smith'
        click_button 'Submit'
      end

      current_path.should eq movie_path(@movie)

      within '#actors-list' do
        expect(page).to_not have_content('Bobby Jones Smith')
      end
    end
  end
end