class InquiryMailer < ActionMailer::Base
  default from: "info@cj-cloud.com"
 
  def received_email(inquiry)
    @inquiry = inquiry
    mail(to: "info@cj-cloud.com", subject: 'お問い合わせを承りました')
  end
 
  def inquiry_email(inquiry, user)
    @inquiry = inquiry
    @user = user
    mail(to: user.email, subject: 'あなたの書き込みについてメーセージが届きました')
  end
end