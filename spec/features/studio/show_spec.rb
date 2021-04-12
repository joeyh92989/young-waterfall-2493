require 'rails_helper'

RSpec.describe 'studio show page' do
  before(:each) do
    @studio_1 = Studio.create!(name: "Joey studio", location: "Denver")
    @movie_1= @studio_1.movies.create!(
      title: "avp",
      creation_year: 1999,
      genre: "sci-fi"
    )
    @movie_2 = @studio_1.movies.create!(
      title: "haunting on the hill",
      creation_year: 1980,
      genre: "horror"
    )
    @movie_3 = @studio_1.movies.create!(
      title: "happy gilmore",
      creation_year: 1995,
      genre: "comedy"
    )

    
    @actor_1= Actor.create!(name: "Harrison", age: 55, currently_working: true)
    @actor_2= Actor.create!(name: "Ford", age: 38, currently_working: false)
    @actor_3 =Actor.create!(name: "Luke", age: 45, currently_working: false)
    ActorMovie.create!(actor: @actor_1, movie: @movie_1)
    ActorMovie.create!(actor: @actor_2, movie: @movie_1)
    ActorMovie.create!(actor: @actor_1, movie: @movie_2)
    ActorMovie.create!(actor: @actor_2, movie: @movie_2)

  end
  it 'lists all the fields ' do

    visit  "/studios/#{@studio_1.id}"

    expect(page).to have_content(@studio_1.name)
    expect(page).to have_content(@studio_1.location)
    within "#movie-#{@movie_1.id}" do
      expect(page).to have_content(@movie_1.title)
    end

    within "#movie-#{@movie_2.id}" do
      expect(page).to have_content(@movie_2.title)
    end

    within "#movie-#{@movie_3.id}" do
      expect(page).to have_content(@movie_3.title)
    end
  end

  it 'lists all the actors in any of the studios movies only once ' do
    visit  "/studios/#{@studio_1.id}"
    expect(page).to have_content('Studio Actors')

    within "#actor-#{@actor_1.id}" do
      expect(page).to have_content(@actor_1.name)
    end
    within "#actor-#{@actor_2.id}" do
      expect(page).to have_content(@actor_2.name)
    end
  end

  it 'lists all the actors in order of age ' do
    visit  "/studios/#{@studio_1.id}"
    expect(@actor_1.name).to appear_before(@actor_2.name)
  end
  it 'lists all the actors currently working ' do

  end
end