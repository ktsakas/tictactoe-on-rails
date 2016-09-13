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

  def get_winner
    board = get_board()

    # Three horizontal
    board.each do |row|
      next if row[0] == " "
      if row.uniq.length == 1 then return row.uniq
    end

    # Three vertical
    board.tranpose.each do |col|
      next if col[0] == " "
      if col.uniq.length == 1 then return col.uniq
    end

    # Three diagonal
    if board[0][0] != " " and 
       board[0][0] == board[1][1] and 
       board[1][1] == board[2][2] then return board[0][0]

    if board[2][0] != " " and
       board[2][0] == board[1][1] and
       board[1][1] == board[0][2] then return board[2][0]

    return nil
  end

  private
    def valid_square(x, y)
      0 < x and x < 2 and 0 < y and y < 2
    end
end
