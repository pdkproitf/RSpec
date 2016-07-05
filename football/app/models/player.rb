class Player < ActiveRecord::Base
	belongs_to :team , class_name: 'Player'
	validates :name, presence:  { message: "can't be blank" },
					 length: { maximum: 140,
					           message: "can't be longer than 140 characters" },
					 uniqueness: { message: "already exists" }
	validates_format_of :shirt_number_integer, with: /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/
	validates :shirt_number_integer, numericality: {only_integer: true, greater_than_or_equal_to: 1}
end
