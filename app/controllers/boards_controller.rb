class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]
  before_action :require_user_logged_in, only: [:create, :edit, :destroy]
  before_action :correct_user, only: [:destroy, :edit]
  def index
    @boards = Board.order(updated_at: :desc).page(params[:page]).per(10)
  end

  def show
    @comments = Comment.where(board_id: @board).order("created_at DESC")
  end

  def new
    @board = Board.new
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      flash[:success] = '正常に投稿されました'
      redirect_to boards_url
    else
      flash.now[:danger] = '投稿されませんでした'
      render :new
    end
    
  end

  def edit
  end

  def update

    if @board.update(board_params)
      flash[:success] = '正常に更新されました'
      redirect_to @board
    else
      flash.now[:danger] = '更新稿されませんでした'
      render :edit
    end
  end

  def destroy
    @board = Board.find(params[:id])
    @board.destroy

    flash[:success] = '投稿は正常に削除されました'
    redirect_to boards_url
  end
  
  private
  
  def set_board
    @board = Board.find(params[:id])
  end
  
  def correct_user
    @board = current_user.boards.find_by(id: params[:id])
    unless @board
      redirect_to root_url unless current_user.admin_flag?
    end
  end
  

  # Strong Parameter
  def board_params
    params.require(:board).permit(
      :title,
      :content,
      :b_category_id,
      :b_area_id,
      :user,
      :agreement,
      :comment
      )
  end
  
end
