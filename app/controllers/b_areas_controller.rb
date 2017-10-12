class BAreasController < ApplicationController
  def show
    @b_area = BArea.find(params[:id])
    @boards = Board.where(b_area_id: @b_area.subtree).order("created_at DESC").page(params[:page])
  end
  
end
