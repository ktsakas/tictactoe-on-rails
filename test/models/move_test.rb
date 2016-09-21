require 'test_helper'

class MoveTest < ActiveSupport::TestCase
  self.use_instantiated_fixtures = true

  test "only allow moves in unfinished games" do
    # assert Move.create({ x: 2, y: 2, game_id: @unfinished.id })
  end

  test "do not allow invalid moves" do
    assert_not Move.new({ x: 3, y: 0, game_id: @unfinished.id }).save
    assert_not Move.new({ x: 0, y: 3, game_id: @unfinished.id }).save
    assert_not Move.new({ x: -1, y: 0, game_id: @unfinished.id }).save
    assert_not Move.new({ x: 0, y: -1, game_id: @unfinished.id }).save
  end

  test "allow valid moves" do
    assert Move.new({ x: 2, y: 2, game_id: @unfinished.id }).save
    assert Move.new({ x: 1, y: 1, game_id: @unfinished.id }).save
  end

  test "cannot play on occupied square" do
    played_move = Move.new({ x: 0, y: 0, game_id: @unfinished.id })
    assert_raises(Exception) { played_move.save }
  end
end
