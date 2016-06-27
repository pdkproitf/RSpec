require 'rails_helper'


RSpec.describe Player, type: :model do

  describe "validations" do
    before(:each) do
      @player = FactoryGirl.build(:player)
      @team = FactoryGirl.build(:team)
    end
    subject { @player}

    it { should validate_presence_of :name }
    it { should validate_numericality_of(:shirt_number_integer).only_integer }
    it { should validate_numericality_of(:shirt_number_integer).is_greater_than_or_equal_to(1) }
  end

  describe "association" do
    it { should belong_to(:team) }
  end

end
