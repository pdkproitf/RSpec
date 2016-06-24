require 'rails_helper'

RSpec.describe :User, type: :model do

  describe "validate email" do 
    before(:each) do
      @user = FactoryGirl.build(:user)
    end
    subject { @user }

    it { @user.should_not be_nil }
  	it { should validate_presence_of :email}

  end

end