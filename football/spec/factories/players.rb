require 'factory_girl_rails'
require 'faker'


FactoryGirl.define do
  factory :player do
    name { Faker::Name.name }
    shirt_number_integer { Faker::Number.number(10) }
  end
end