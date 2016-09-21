class Move < ApplicationRecord
  belongs_to :game
  validate :game_is_not_finished
  validate :move_is_valid

  # Make moves immutable
  def readonly?
    !new_record?
  end

  def move_is_valid
      if self.x < 0 or 2 < self.x
        errors.add(:x, "invalid move x coordinate")
      end

      if self.y < 0 or 2 < self.y 
        errors.add(:y, "invalid move y coordinate")
      end
    end

  def game_is_not_finished
    if self.game.is_finished?
      errors.add(:game, "game is finished")
    end
  end
end
