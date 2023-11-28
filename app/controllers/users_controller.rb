class UsersController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, except: [:index, :show]
  
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

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to root_path
  end

end

private
  def user_params
    params.require(:user).permit(:name, :email)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end