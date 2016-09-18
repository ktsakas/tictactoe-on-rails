class GamesController < ApplicationController
  def show
    game = Game.find_by(id: params[:id])

    render json: game.to_json(:include => :moves)
  end

  def create
    game = Game.create({})


  end
end
