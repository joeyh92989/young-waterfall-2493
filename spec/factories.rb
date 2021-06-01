FactoryBot.define do
  factory :movie do
    title { Faker::Movie.title }
    creation_year { rand(1999..2021) }
    genre { Faker::Book.genre }
  end

  factory :studio do
    name { Faker::Company.name }
    location  {Faker::Address.city }
  end

  factory :actor do
    name { Faker::Name.name }
    age { rand(18..50) }
    currently_working { true }
  end
end