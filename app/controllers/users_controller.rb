class UsersController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
  end

  def show
    user = User.find(params[:id])
    @name = user.name
    @Email = user.email
  end

  def edit

  end

end