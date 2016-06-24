class Team < ActiveRecord::Base
	has_many :player
	validates :name,presence:  { message: "can't be blank" },
					length: { maximum: 140, message: "can't be longer than 140 characters" },
					uniqueness: { message: "already exists" }

end