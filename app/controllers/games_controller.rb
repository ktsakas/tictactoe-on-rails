class GamesController < ApplicationController
  def index
    game = Game.find_by(id: 1)

    render json: game.to_json(:include => :moves)
  end

  def create
    game = Game.create({})
  end
end
