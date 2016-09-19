class Move < ApplicationRecord
	belongs_to :game
	validate :is_game_not_finished

	# Make moves immutable
	def readonly?
		!new_record?
	end

	def is_game_not_finished
		self.game.is_finished
	end
end
