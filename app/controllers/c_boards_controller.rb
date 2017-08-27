class CBoardsController < ApplicationController
  before_action :set_c_board, only: [:show, :edit, :update, :destroy]
  before_action :require_user_logged_in, only: [:create, :edit, :destroy]
  before_action :correct_user, only: [:destroy, :edit]
  def index
    @c_boards = CBoard.all
  end

  def show
  end

  def new
    @c_board = CBoard.new
  end

  def create
    @c_board = current_user.c_boards.build(c_board_params)
    if @c_board.save
      flash[:success] = '正常に投稿されました'
      redirect_to c_boards_url
    else
      flash.now[:danger] = '投稿されませんでした'
      render :new
    end
    
  end

  def edit
  end

  def update

    if @c_board.update(c_board_params)
      flash[:success] = '正常に更新されました'
      redirect_to @c_board
    else
      flash.now[:danger] = '更新稿されませんでした'
      render :edit
    end
  end

  def destroy
    @c_board.destroy

    flash[:success] = '投稿は正常に削除されました'
    redirect_to c_boards_url
  end
  
  private
  
  def set_c_board
    @c_board = CBoard.find(params[:id])
  end
  
  def correct_user
    @c_board = current_user.c_boards.find_by(id: params[:id])
    unless @c_board
      redirect_to root_url
    end
  end
  

  # Strong Parameter
  def c_board_params
    params.require(:c_board).permit(
      :title,
      :content,
      :category_id,
      :area_id,
      :tel,
      :user,
      :image,
      :image_cache,
      :remove_image,
      :s_image,
      :s_image_cache,
      :s_remove_image,
      :t_image,
      :t_image_cache,
      :t_remove_image,
      :f_image,
      :f_image_cache,
      :f_remove_image
      )
  end
  
end
