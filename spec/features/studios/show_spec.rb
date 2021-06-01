require 'rails_helper'

RSpec.describe 'The show page for a studio,' do
  before :all do
    @studio = FactoryBot.create(:studio)
    @movie_1 = FactoryBot.create(:movie, studio: @studio)
    @movie_2 = FactoryBot.create(:movie, studio: @studio)
    @movie_3 = FactoryBot.create(:movie, studio: @studio)
  end

  before :each do
    visit "/studios/#{@studio.id}"
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
end