class CBoardsController < ApplicationController
  def index
    @c_boards = CBoard.all
  end

  def show
    @c_board = CBoard.find(params[:id])
  end

  def new
    @c_board = CBoard.new
  end

  def create
    @c_board = current_user.c_boards.build(c_board_params)
    if @c_board.save
      flash[:success] = '正常に投稿されました'
      redirect_to root_url
    else
      @c_board = current_user.c_boards.order('created_at DESC').page(params[:page])
      flash.now[:danger] = '投稿されませんでした'
      render :new
    end
    
  end

  def edit
    @c_board = CBoard.find(params[:id])
  end

  def update
    @c_board = CBoard.find(params[:id])
    
    if @c_board.update(c_board_params)
      flash[:success] = '正常に更新されました'
      redirect_to @c_board
    else
      flash.now[:danger] = '更新稿されませんでした'
      render :edit
    end
  end

  def destroy
    @c_board = CBoard.find(params[:id])
    @c_board.destroy

    flash[:success] = '投稿は正常に削除されました'
    redirect_to c_boards_url
  end
  
  private

  # Strong Parameter
  def c_board_params
    params.require(:c_board).permit(:title, :content)
  end
  
end
