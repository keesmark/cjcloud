class ToppagesController < ApplicationController
  def index
    @c_boards = CBoard.order(created_at: :desc).limit(6)
    @boards = Board.order(created_at: :desc).limit(10)
  end
end
