def generate_game(board) 
  game = Game.create({})

  moves = 0
  x_moves = []
  o_moves = []

  # Loop through the board and create move objects
  board.each_with_index do |row, y|
    row.each_with_index do |item, x|
      move = { x: x, y: y, game_id: game.id }

      if    item == "X" then x_moves.push(move)
      elsif item == "O" then o_moves.push(move)
      end

      moves += 1
    end
  end

  x_moves.each do |x_move|
    # X player move
    Move.create(x_move)

    # O player move
    unless o_moves.empty? then Move.create(o_moves.pop) end
  end
end

# Unfinished game
generate_game([
  ["X", "O", " "],
  [" ", " ", " "],
  [" ", " ", " "]
])

# Player X wins game with three in second row
generate_game([
  ["X", "O", "O"],
  ["X", "X", "X"],
  ["O", " ", " "]
])

# Player O wins game with three in first column
generate_game([
  ["O", "O", "O"],
  ["X", " ", "X"],
  ["X", " ", " "]
])

# Player X wins game with three in third row
generate_game([
  ["O", "O", " "],
  ["O", " ", " "],
  ["X", "X", "X"]
])

# Game is drawn
generate_game([
  ["X", "X", "O"],
  ["O", "X", "X"],
  ["O", "X", "O"]
]);


# Player X wins with three diagonally
generate_game([
  ["X", "O", " "],
  ["O", "X", " "],
  ["O", " ", "X"]
]);

# Player O wins with three diagonally
generate_game([
  ["X", "X", "O"],
  [" ", "O", "X"],
  ["O", " ", " "]
]);