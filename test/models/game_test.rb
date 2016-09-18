require 'test_helper'

class GameTest < ActiveSupport::TestCase
  test "correct number of games" do
  	puts Game.find_by(id: 1).inspect

  	assert_equal 7, Game.count
  end
end
