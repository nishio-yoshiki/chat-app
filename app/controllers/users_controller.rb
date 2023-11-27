class UsersController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    user = User.find(params[:id])
  end

  def show
    user = User.find(params[:id])
    @name = user.name
    @Email = user.email
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

end

private
  def user_params
    params.require(:user).permit(:name, :email)
  end