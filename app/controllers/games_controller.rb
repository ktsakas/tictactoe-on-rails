class GamesController < ApplicationController
  def index
    articles = [
      { id: 123, name: 'The Things' },
    ]

    render json: articles
  end
end
