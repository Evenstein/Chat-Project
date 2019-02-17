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
    chat_room = ChatRoom.find params[:chat_room_id]
    @message = chat_room.messages.build(message_params)
    if @message.save
      flash[:success] = 'Message created'
    else
      flash[:error] = 'Message creation fault'
    end
    redirect_to chat_rooms_path
  end

  private
    def message_params
      params.require(:chat_room).permit(:id)
    end
end
