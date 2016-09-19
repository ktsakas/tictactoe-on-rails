require 'test_helper'

class GameTest < ActiveSupport::TestCase
  self.use_instantiated_fixtures = true

  def assert_2d_array_eq a1, a2
    a1.each_with_index do |row, y|
      row.each_with_index do |elm, x|
        unless elm == a2[y][x] 
          return assert_equal elm, a2[y][x]
        end
      end
    end

    assert true
  end

  test "get board method" do
    assert_2d_array_eq [
      [ "X", "O", " " ],
      [ " ", " ", " " ],
      [ " ", " ", " " ]
    ], Game.find_by(id: 1).get_board()

    assert_2d_array_eq [
      [ "X", "O", "O" ],
      [ "X", "X", "X" ],
      [ "O", " ", " " ]
    ], Game.find_by(id: 2).get_board()

    assert_2d_array_eq [
      [ "O", "O", "O" ],
      [ "X", " ", "X" ],
      [ "X", " ", " " ]
    ], Game.find_by(id: 3).get_board()

    assert_2d_array_eq [
      [ "O", " ", " " ],
      [ " ", "O", " " ],
      [ "X", "X", "X" ]
    ], Game.find_by(id: 4).get_board()

    assert_2d_array_eq [
      [ "X", "X", "O" ],
      [ "O", "X", "X" ],
      [ "X", "O", "O" ]
    ], Game.find_by(id: 5).get_board()

    assert_2d_array_eq [
      [ "X", " ", " " ],
      [ "O", "X", " " ],
      [ "O", " ", "X" ]
    ], Game.find_by(id: 6).get_board()

    assert_2d_array_eq [
      [ "X", "X", "O" ],
      [ " ", "O", "X" ],
      [ "O", " ", " " ]
    ], Game.find_by(id: 7).get_board()
  end

  test "get winner method" do
    assert_nil Game.find_by(id: 1).get_winner()
    assert_equal "X", Game.find_by(id: 2).get_winner()
    assert_equal "O", Game.find_by(id: 3).get_winner()
    assert_equal "X", Game.find_by(id: 4).get_winner()
    assert_nil Game.find_by(id: 5).get_winner()
    assert_equal "X", Game.find_by(id: 6).get_winner()
    assert_equal "O", Game.find_by(id: 7).get_winner()
  end
end
