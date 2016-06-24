class User < ActiveRecord::Base
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i},
                    presence: true,
                    uniqueness: {message: "alrealy exits"}
  validates :smartphone, numericality: {only_integer: true}

  validates :name, presence: true, length: { minimum:  8}
  validates :password, presence: true, confirmation: true,length: { minimum: 8 }

end