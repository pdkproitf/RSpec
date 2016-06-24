require 'factory_girl_rails'
require 'faker'


FactoryGirl.define do
  factory :team do
    name { Faker::Name.name }
    location { Faker::Address.street_address }
  end
end