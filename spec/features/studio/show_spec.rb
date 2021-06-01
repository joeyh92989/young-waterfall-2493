require 'rails_helper'

RSpec.describe 'the studio show' do

  #   Story 1
  # Studio Show
  #
  # As a user,
  # When I visit a studio show page
  # I see the studio's name and location
  # And I see the titles of all of its movies

  it 'shows attributes of a studio and its movies' do
    studio = Studio.create!(name: 'Universal Studios', location: 'Hoolywood')
    # actor = Actor.create!(name: 'Harrison Ford', age: 78, currently_working: false)
    studio.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    studio.movies.create!(title: 'Moana', creation_year: 2016, genre: 'animation')
    studio.movies.create!(title: 'Shrek', creation_year: 2001, genre: 'animation')
    visit "studios/#{studio.id}"
    # save_and_open_page
    expect(page).to have_content(studio.name)
    expect(page).to have_content(studio.location)
    expect(page).to have_content('Moana')
    expect(page).to have_content('Shrek')
  end

  #   Story 2
  # Studio's Actors
  #
  # As a user,
  # When I visit a studio show page
  # I see a list of actors that have acted in any of the studio's movies
  # And I see that the list of actors is unique (no duplicate actors)
  # And I see that the list of actors is ordered from oldest actor to youngest
  # And I see that the list of actors only includes actors that are currently working

  it 'shows page should have a list of actors' do
    studio = Studio.create!(name: 'Universal Studios', location: 'Hoolywood')
    movie1 = studio.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    studio.movies.create!(title: 'Moana', creation_year: 2016, genre: 'animation')
    studio.movies.create!(title: 'Shrek', creation_year: 2001, genre: 'animation')
    actor1 = Actor.create!(name: 'Harrison Ford', age: 78, currently_working: false)
    actor2 = Actor.create!(name: 'Leonardio DiCaprio', age: 46, currently_working: true)
    actor3 = Actor.create!(name: 'Venicio Del Toro', age: 54, currently_working: true)
    ActorsMovies.create!(actor: actor1, movie: movie1)
    # binding.pry
    visit "studios/#{studio.id}"
    save_and_open_page

  end
end
