class GamesController < ApplicationController
  def index
    game = Game.find_by(id: 1)
    board = game.get_board()

    game.moves = [1, 2, 3, 4]
    game.save

    puts "Saved game!"

    articles = [
      { id: 123, name: 'The Things', board: board },
    ]

    render json: articles
  end
end
