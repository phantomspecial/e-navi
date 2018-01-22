class NotificationMailer < ApplicationMailer
  default from: "hogehoge@example.com"


  def send_interviewdate_to_hr(send_user,user)
    @send_user = send_user
    @user = user
    mail(
      subject: "面接希望日が決まりました。" ,
      to: @send_user.email
    ) do |format|
      format.text
    end
  end


  def send_interviewdate_to_user(send_user,user)
    @send_user = send_user
    @user = user
    mail(
      subject: "面接希望日を決定しました。" ,
      to: @user.email
    ) do |format|
      format.text
    end
  end

  def send_interviewdate_edit_to_hr(send_user,user,interview)
    @send_user = send_user
    @user = user
    @interview = interview
    mail(
      subject: "面接日時が確定されました。" ,
      to: @send_user.email,
      cc: @user.email
    ) do |format|
      format.text
    end
  end

end
