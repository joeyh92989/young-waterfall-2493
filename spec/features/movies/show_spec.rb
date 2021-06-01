require 'rails_helper'

RSpec.describe 'the movies show' do

  # Story 3
  # Movie Show
  #
  # As a user,
  # When I visit a movie's show page.
  # I see the movie's title, creation year, and genre,
  # and I see all of the actors in the movie

  it 'shows attributes of a studio and its movies' do
    studio = Studio.create!(name: 'Universal Studios', location: 'Hoolywood')
    # actor = Actor.create!(name: 'Harrison Ford', age: 78, currently_working: false)
    movie = studio.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    visit "movies/#{movie.id}"
    # save_and_open_page
    expect(page).to have_content(movie.title)
    expect(page).to have_content(movie.creation_year)
    expect(page).to have_content(movie.genre)
  end

  #   Story 4
  # Add an Actor to a Movie
  #
  # As a user,
  # When I visit a movie show page,
  # I do not see any actors listed that are not part of the movie
  # And I see a form to add an actor to this movie
  # When I fill in the form with the name of an actor that exists in the database
  # And I click submit
  # Then I am redirected back to that movie's show page
  # And I see the actor's name is now listed
  #
  # (You do not have to test for any sad path, for example if the name submitted does not match an existing actor)

  it 'shows attributes of a studio and its movies' do
    studio = Studio.create!(name: 'Universal Studios', location: 'Hoolywood')
    actor = Actor.create!(name: 'Harrison Ford', age: 78, currently_working: false)
    movie = studio.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    visit "movies/#{movie.id}"
    expect(page).to have_field(:actor_name)
    fill_in( :actor_name, with: "Harrison Ford")
    click_on("Find")
    click_on("Add")
    # expect(page).to have_content(actor.name)
    save_and_open_page


    # expect(page).to have_content(movie.creation_year)
    # expect(page).to have_content(movie.genre)


  end

end
