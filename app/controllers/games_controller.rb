class GamesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    game = Game.find_by(id: params[:id])

    render json: game.to_json(:include => :moves)
  end

  def create
    game = Game.create({})
    game.save

    render json: game.to_json(:include => :moves)
  end
end
