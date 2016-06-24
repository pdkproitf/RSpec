require 'test_helper'
 
class PlayerTest < ActiveSupport::TestCase
  test "validate name" do
    player = Player.new name: ''
    assert_equal player.save, false
  end
 
  test "validate shirt as integer" do
    player = Player.new name: 'test', shirt_number: 'n'
    assert_equal player.save, false
  end
 
  test "validate shirt as integer greater than zero" do
    player = Player.new name: 'test', shirt_number: -1
    assert_equal player.save, false
  end
end