class UsersController < ApplicationController

  def index
    @users = User.where.not(id: current_user.id)
  end

  def show
  end

  def edit
  end

  def update
    user = current_user
    user.update(user_params)
    redirect_to edit_user_path(current_user.id)
  end

  private
  def user_params
    params.require(:user).permit(:email, :name, :birthday, :gender, :univ)
  end

end
