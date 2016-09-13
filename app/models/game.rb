class Game < ApplicationRecord
  def create(x, y)
    if !valid_square(x, y)
      puts "Invalid square!"
    end

    first_move = x * 3 + y

    g = Game.new
    g.moves.push(first_move)
    g.save
  end

  def play(x, y)
    if !valid_square(x, y)
      puts "Invalid square!"
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

  private
    def valid_square(x, y)
      0 < x and x < 2 and 0 < y and y < 2
    end
end
