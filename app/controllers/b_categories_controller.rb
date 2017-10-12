class BCategoriesController < ApplicationController
  def show
    @b_category = BCategory.find(params[:id])
    @b_area = BArea.find(params[:b_area_id])
    @boards = Board.where(b_area_id: @b_area.subtree, b_category_id: @b_category.subtree).order("created_at DESC").page(params[:page])
  end
  
end
