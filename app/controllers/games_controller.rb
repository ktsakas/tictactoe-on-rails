class GamesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    game = Game.find_by(id: params[:id])

    render json: game.to_json(:include => :moves)
  end

  def create
    game = Game.create({})
    game.save

    render json: game
  end

  def update
    game = Game.find_by(id: params[:id])

    Move.create(x: params[:x], y: params[:y], game_id: game.id)
  end
end
