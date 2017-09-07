class ToppagesController < ApplicationController
  def index
    @c_boards = CBoard.order(created_at: :desc).limit(6)
  end
end
