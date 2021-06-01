require 'rails_helper'

RSpec.describe Actor do
  describe 'class method,' do
    before :all do
      @studio_1 = FactoryBot.create(:studio)
      @studio_2 = FactoryBot.create(:studio)
      @movie_1 = FactoryBot.create(:movie, studio: @studio_1)
      @movie_2 = FactoryBot.create(:movie, studio: @studio_1)
      @movie_3 = FactoryBot.create(:movie, studio: @studio_1)
      @movie_4 = FactoryBot.create(:movie, studio: @studio_2)

      @actor_1 = FactoryBot.create(:actor, currently_working: false)
      @actor_2 = FactoryBot.create(:actor, age: 18)
      @actor_3 = FactoryBot.create(:actor, age: 22)
      @actor_4 = FactoryBot.create(:actor, age: 37)
      @actor_5 = FactoryBot.create(:actor, age: 23)

      @movie_1.actors << @actor_1 << @actor_2
      @movie_2.actors << @actor_2 << @actor_3 << @actor_4
      @movie_3.actors << @actor_1 << @actor_2 << @actor_4
      @movie_4.actors << @actor_5
    end

    describe '::actors_in_movies_for_studio' do
      it 'returns a list of actors played at studios movies and are uniq and are oldest to youngest' do
        expected_result = [@actor_4, @actor_3, @actor_2]
        actual_result = Actor.actors_in_movies_for_studio(@studio_1)

        expect(actual_result).to eq expected_result
      end

      it 'only shows actors that are working' do
        actual_result = Actor.actors_in_movies_for_studio(@studio_1)

        expect(actual_result.include?(@actor_1)).to eq false
      end
    end
  end
end