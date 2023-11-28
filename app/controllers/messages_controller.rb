class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_current_room, only: [:index]

  def index
    @room = Room.all
    
  end

  def new
    @tweet = Tweet.new
  end

  def edit
  end

  private

  def set_current_room
    # パラメーターからチャットルーム情報を取得
    @current_room = Room.find_by(id: params[:room_id])
  end
  
end