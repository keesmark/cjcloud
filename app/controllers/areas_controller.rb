class AreasController < ApplicationController
  def show
    @c_board = CBoard.where(area_id: params[:id])
    @area = Area.find(params[:id])
  end
end
