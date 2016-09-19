require 'test_helper'

class MoveTest < ActiveSupport::TestCase
  self.use_instantiated_fixtures = true

  test "only allow moves in unfinished games" do
    # assert Move.create({ x: 2, y: 2, game_id: @unfinished.id })
  end

  test "do not allow invalid moves" do
    invalid_move = Move.new({ x: 0, y: 0, game_id: @unfinished.id })
    assert_not invalid_move.save
  end
end
