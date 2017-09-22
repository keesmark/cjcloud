class CategoriesController < ApplicationController
  def show
    @c_boards = CBoard.where(area_id: params[:area_id], category_id: params[:id]).page(params[:page])
    @area = Area.find(params[:area_id])
    @category = Category.find(params[:id])
  end
  
end
