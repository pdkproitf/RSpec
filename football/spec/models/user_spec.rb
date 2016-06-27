require 'rails_helper'

RSpec.describe :User do

  before(:all) do
      @user = FactoryGirl.build(:user)
    end
  subject { @user }

  it { @user.should_not be_nil }

  describe "validate email" do
    it { @user.email.should_not be_nil }
    it { should allow_value("email@addresse.foo").for(:email) }
    it { should_not allow_value("foo").for(:email) }
  end

  it { should validate_numericality_of(:smartphone).only_integer }

  describe "validate name" do
    it { should validate_presence_of :name }
    it { should validate_length_of :name }
  end

  describe "presence " do
      [:name,:email].each do |attribute|
        it { is_expected.to validate_presence_of(attribute) }
      end
  end

  describe "validate password" do
    it { should validate_confirmation_of :password }
    it { should validate_length_of :password }
    it { should have_secure_password }
  end

end
