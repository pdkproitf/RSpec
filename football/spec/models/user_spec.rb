require 'rails_helper'

RSpec.describe :User, type: :model do

  before(:all) do
      @user = FactoryGirl.build(:user)
    end
  subject { @user }

  describe "validate email" do 

    it { @user.should_not be_nil }
  	it { should validate_presence_of :email}

  end

  describe "validate smartphone" do 
    it { should validate_numericality_of(:smartphone).only_integer }
  end

  describe "validate name" do
    it { should validate_presence_of :name }
    it { should validate_length_of :name }
  end

  describe "validate password" do
    it { should validate_presence_of :password }
    it { should validate_confirmation_of :password }
    it { should validate_length_of :password }
    # it { should have_secure_password }   ********** chua lam dc 
  end

end