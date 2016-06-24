class User < ActiveRecord::Base
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i},
                    presence: true,
                    uniqueness: {message: "alrealy exits"}

end