require 'test_helper'

class GameTest < ActiveSupport::TestCase
  test "get winner method" do
  	puts Game.find_by(id: 7).get_board.to_json

  	# assert_nil Game.find_by(id: 1).get_winner()
  	# assert_equal "X", Game.find_by(id: 2).get_winner()
  	# assert_equal "O", Game.find_by(id: 3).get_winner()
  	# assert_equal "X", Game.find_by(id: 4).get_winner()
  	# assert_nil Game.find_by(id: 5).get_winner()
  	# assert_equal "X", Game.find_by(id: 6).get_winner()
  	# assert_equal "O", Game.find_by(id: 7).get_winner()
  end
end
