class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :edit, :destroy, :update]
  before_action :admin_user, only: [:admin]
  
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user =User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    flash[:success] = '投稿は正常に削除されました'
    redirect_to c_boards_url
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
      if !@user.authenticate(params[:user][:current_password])
        flash.now[:danger] = '現在のパスワードが一致しません'
        render :edit
      elsif @user.update_attributes(user_params)
        flash[:success] = 'ユーザー情報を変更しました。'
        redirect_to @user
        # 更新に成功したときの処理
      else
        flash.now[:danger] = '更新に失敗しました。'
        render :edit
      end
  end
  
  def admin
    @users = User.all
    @c_boards = CBoard.all
    @boards = Board.all
    @comments = Comment.all
    
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def password_current(email, password)
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password)
      session[:user_id] = @user.id
      return true
    else
      return false
    end
  end
  
end
