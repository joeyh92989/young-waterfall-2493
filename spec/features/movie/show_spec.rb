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
end