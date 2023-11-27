class MessagesController < ApplicationController

  before_action :authenticate_user!, only: [:index]
  
  def index
  end

  def new
    @tweet = Tweet.new
  end

  def edit
  end


end
