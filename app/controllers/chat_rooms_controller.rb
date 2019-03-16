# frozen_string_literal:true

class ChatRoomsController < ApplicationController
  def index
    @chat_rooms = ChatRoom.order(:title).page params[:page]
  end

  def new
    @chat_room = ChatRoom.new
  end

  def create
    @chat_room = current_user.chat_rooms.build(chat_room_params)
    if @chat_room.save
      flash[:success] = 'Chat room added!'
      redirect_to chat_rooms_path
    else
      flash[:error] = 'Chat room creation fault'
      render 'new'
    end
  end

  def show
    @chat_room = ChatRoom.find(params[:id])
    @messages = Message.where(chat_room_id: params[:id]).order(updated_at: :desc).page(params[:page]).per(5)
  end

  private

  def chat_room_params
    params.require(:chat_room).permit(:title)
  end
end
