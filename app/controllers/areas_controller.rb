class AreasController < ApplicationController
  def show
    @c_boards = CBoard.where(area_id: params[:id]).page(params[:page])
    @area = Area.find(params[:id])
  end
end
