require 'test_helper'

class GameTest < ActiveSupport::TestCase
  test "correct number of games" do
  	puts Game.find_by(id: 1).get_board.to_json

  	assert_equal 7, Game.count
  end
end
