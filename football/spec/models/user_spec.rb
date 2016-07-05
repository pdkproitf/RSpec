require 'rails_helper'

RSpec.describe :User do

  before(:all) do
      @user = FactoryGirl.build(:user)
    end
  subject { @user }

  it { expect(@user).to be_truthy }#not nil not false

  describe "validate email" do
    it { expect(@user.email).to be_truthy }
    it { expect(@user).to allow_value("email@addresse.foo").for(:email) }
    it { expect(@user).not_to allow_value("foo").for(:email) }
    it { expect(@user).to validate_uniqueness_of(:email) }
  end

  it "should be invalid for case false" do
    addresses = %w[user@foo.com user_at_foo.org
                    example.user@foo.foo@baz_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).not_to be_valid
      end
  end

  it { expect(@user).to validate_numericality_of(:smartphone).only_integer }

  describe "validate name" do
    it { expect(@user.name).to be_truthy }
    it { expect(@user.name.size).to be >= 8 }
  end

  describe "presence " do
      [:name,:email].each do |attribute|
        it { is_expected.to validate_presence_of(attribute) }
      end
  end

  describe "validate password" do
    it { expect(@user).to validate_length_of(:password).is_at_least(8).is_at_most(25) }
    it { expect(@user).to validate_confirmation_of(:password) }
    it { is_expected.to have_secure_password }
  end

end
