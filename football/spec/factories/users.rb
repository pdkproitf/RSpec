require 'factory_girl_rails'
require 'faker'

FactoryGirl.define do
	factory :user do
		name { Faker::Name.name }
		smartphone { Faker::PhoneNumber.phone_number }
		email { Faker::Internet.email }
		password { Faker::Internet.password(8) }
	end
end
