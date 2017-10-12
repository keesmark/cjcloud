class CommentsController < ApplicationController
  before_action :set_board
  before_action :correct_user, only: [:destroy]
  
  def create
    @comment = @board.comments.create(comment_params)
    @comment.user.name = current_user.name
    @comment.save
    
    if @comment.save
      flash[:success] = '正常にコメントされました'
      redirect_to board_path(@board)
    else
      flash[:danger] = 'コメントされませんでした'
      redirect_to board_path(@board)
    end
      
  end
  
  def destroy
    @comment = @board.comments.find(params[:id])
    @comment.destroy

    flash[:success] = '投稿は正常に削除されました'
    redirect_to boards_path(@board)
  end
  
  private
  def set_board
    @board = Board.find(params[:board_id])
  end
  
  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end
  
  def correct_user
    @comment = current_user.comments.find_by(id: params[:id])
    unless @comment
      redirect_to boards_path(@board) unless current_user.admin_flag?
    end
  end
  
end
