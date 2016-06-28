require 'rails_helper'

RSpec.describe Team do

  before(:all) do
    @team = FactoryGirl.build(:team)
  end
  subject{ @team }

  it "is valid with valid attributes" do
    expect(@team).to be_valid
    expect(@team.name).to be_truthy# passes if actual is truthy (not nil or false)
    expect(@team.location).to be_truthy
    expect(@team).to respond_to(:name)
  end

  describe "acssociations" do
    it { is_expected.to have_many(:players) }
  end

end
