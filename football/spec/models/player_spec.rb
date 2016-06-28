require 'rails_helper'


RSpec.describe Player, type: :model do

  describe "validations" do
    before(:each) do
      @player = FactoryGirl.build(:player)
      @team = FactoryGirl.build(:team)
    end
    subject { @player}

    it { expect(@player).to be_truthy }
    it { expect(@player).to validate_numericality_of(:shirt_number_integer).is_greater_than_or_equal_to(1).only_integer }
  end

  describe "association" do
    it { expect belong_to(:team) }
  end

end
