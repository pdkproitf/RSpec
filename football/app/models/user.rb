class User < ActiveRecord::Base
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i },
                    presence: true,
                    uniqueness: true,
                    allow_nil: false
  validates_email_format_of :email, :message => 'is not looking good' # exactly
  #just need only this line for email test because it use
  #gem 'validates_email_format_of'

  validates :smartphone, numericality: { only_integer: true },
                         format: { with: /\A^\+?\d{1,3}?[- .]?\(?(?:\d{2,3
                          })\)?[- .]?\d\d\d[- .]?\d\d\d\d\z/i }


  validates :name, presence: true, length: { minimum:  8 }

  has_secure_password
  validates :password, presence: true, confirmation: true,length: { minimum: 8 ,
                                                                    maximum: 25}
  validates_confirmation_of :password
end
