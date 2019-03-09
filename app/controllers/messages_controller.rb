# frozen_string_literal:true

class MessagesController < ApplicationController

  respond_to :js, :json, :html

  def index
    @message = Message.order(:created_at).page params[:page]
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:success] = 'Message created'
    else
      flash[:error] = 'Message creation fault'
    end
    redirect_to chat_room_path(message_params[:chat_room_id])
  end

  private
    def message_params
      params.permit(:user_id, :chat_room_id, :body)
    end
end
