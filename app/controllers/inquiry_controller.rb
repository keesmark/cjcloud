class InquiryController < ApplicationController
  def index
    @inquiry = Inquiry.new
    render :action => 'index'
  end
 
  def confirm
    @inquiry = Inquiry.new(params_inquiry)
    if @inquiry.valid?
      render :action => 'confirm'
    else
      render :action => 'index'
    end
  end
 
  def thanks
    @inquiry = Inquiry.new(params_inquiry)
    InquiryMailer.received_email(@inquiry).deliver
     render :action => 'thanks'
  end
  
  def c_board_index
    @c_board = CBoard.find(params[:c_board_id])
    @inquiry = Inquiry.new
  end
  
  def c_board_confirm
    @c_board = CBoard.find(params[:c_board_id])
    @inquiry = Inquiry.new(params_inquiry)
    if @inquiry.valid?
      render :action => 'c_board_confirm'
    else
      render :action => 'c_board_index'
    end
  end

  def c_board_thanks
    @c_board = CBoard.find(params[:c_board_id])
    @user = @c_board.user
    @inquiry = Inquiry.new(params_inquiry)
    InquiryMailer.inquiry_email(@inquiry, @user).deliver
    render :action => 'c_board_thanks'
  end
  
  
  private 
  def params_inquiry
    params.require(:inquiry).permit(:name, :email, :message, :user)
  end
  
end