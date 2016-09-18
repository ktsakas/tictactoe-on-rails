require 'test_helper'

class MoveTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "right number of tests" do
  	assert_equal 2, Move.count
  end
end
