class CategoriesController < ApplicationController
  def show
    @c_board = CBoard.where(area_id: params[:area_id], category_id: params[:id])
  end
  
end
