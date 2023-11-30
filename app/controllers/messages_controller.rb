class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_current_room, only: [:index, :create]

  def index
    @rooms = Room.all
    @room = Room.find_by(id: params[:room_id])
    @messages = @current_room.messages.order(created_at: :asc)
    @message = Message.new
  end

  def new
    @message = Message.new
  end

  def create
    @message = @current_room.messages.new(message_params)
    @message.user = current_user

    if @message.save
      redirect_to room_path(@current_room), notice: 'メッセージが投稿されました'
    else
      render :index, alert: 'メッセージの投稿に失敗しました'
    end
  end


  private

  def set_current_room
    # パラメーターからチャットルーム情報を取得
    @current_room = Room.find_by(id: params[:room_id])

    unless @current_room
      redirect_to root_path, alert: '指定されたチャットルームが見つかりませんでした。'
    end
  end

  def message_params
    params.require(:message).permit(:content, :image)
  end
end
