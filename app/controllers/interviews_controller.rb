class InterviewsController < ApplicationController

  def index
    @interviews = set_interviews.order(starttime: 'asc')
    @addresses = User.where.not(id: current_user.id)
  end

  def new
    @interview = set_interviews.new
  end

  def create
    @interview = set_interviews.create(interview_params)
  end

  def edit
    @interview = set_interviews.find(params[:id])
  end

  def update
    @interview = set_interviews.find(params[:id])
    @interview.update(interview_params)
  end

  def destroy
    interview = set_interviews.find(params[:id])
    interview.delete
    redirect_to user_interviews_path(current_user.id)
  end


  def hrviewsindex
    @user = User.find(params[:user_id])
    @selectedinterview = Interview.where(user_id: params[:user_id]).where(status: '承認').first
    @thisuserinterviews = Interview.where(user_id: params[:user_id])
  end

  def hrviewupdate
    thisuserinterviews = Interview.where(user_id: params[:user_id])
    thisuserinterviews.each do |thisuserinterview|
      if thisuserinterview.id == params[:interviewid].to_i
        thisuserinterview.update(status: '承認')
        @interview = thisuserinterview
      else
        thisuserinterview.update(status: '却下')
      end
    end

    @send_user = current_user
    @user = User.find(params[:user_id])

    NotificationMailer.send_interviewdate_edit_to_hr(@send_user, @user,@interview).deliver
  end

  def newdatemailsender
    @send_user = User.where(email: send_address_params[:send_email]).first
    @user = current_user

    NotificationMailer.send_interviewdate_to_hr(@send_user, @user).deliver
    NotificationMailer.send_interviewdate_to_user(@send_user, @user).deliver
  end

  private
  def interview_params
    params.require(:interview).permit(:user_id, :starttime, :status)
  end

  def send_address_params
    params.permit(:send_email)
  end

  def set_interviews
    return current_user.interviews
  end

end
