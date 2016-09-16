class Move < ApplicationRecord
	belongs_to :game

	# Make moves immutable
	def readonly?
		!new_record?
	end
end
