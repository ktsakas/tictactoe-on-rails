class Game < ApplicationRecord
  def play(x, y)
    if x < 0 or y < 0 or x > 2 or y > 2
      puts "Move out of bounds!"
    end

    move = x * 3 + y

    game = Game.find_by(id: 1)
    if game.moves.include?(move)
      puts "Square (#{x}, #{y}) is filled"
    end

    game.moves.push(move)
    game.save
  end

  def get_board()
    board = Array.new(3){Array.new(3, " ")}
    game = Game.find_by(id: 1)

    game.moves.each do |move|
      y = move % 3
      x = (move - y) / 3

      board[x][y] = "X"
    end

    board
  end
end
