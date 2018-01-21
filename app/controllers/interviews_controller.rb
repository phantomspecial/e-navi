class InterviewsController < ApplicationController

  def index
    @interviews = set_interviews
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
  end

  private
  def interview_params
    params.require(:interview).permit(:user_id, :starttime, :status)
  end

  def set_interviews
    return current_user.interviews
  end

end
