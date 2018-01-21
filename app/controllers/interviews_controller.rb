class InterviewsController < ApplicationController

  def index
    @interviews = current_user.interviews
  end

  def show
  end

  def new
    @interview = current_user.interviews.new
  end

  def create
    @interview = current_user.interviews.create(interview_params)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def interview_params
    params.require(:interview).permit(:user_id, :starttime, :status)
  end

end
