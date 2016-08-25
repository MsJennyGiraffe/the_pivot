class ChatRoomsController < ApplicationController
  def index
    @chat_rooms = ChatRoom.all
  end

  def new
    @chat_room = ChatRoom.new
  end

  def show
    @chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])
    @message = Message.new
  end

  def create
    if current_user
      @chat_room = current_user.chat_rooms.build(chat_room_params)
      if @chat_room.save
        flash[:success] = 'Chat Room Added!'
        redirect_to chat_rooms_path
      else
        flash[:warning] = "Chat Room must have unique title."
        render 'new'
      end
    else
      flash[:warning] = "Must be logged in to chat"
      redirect_to login_path
    end
  end


  private

  def chat_room_params
    params.require(:chat_room).permit(:title)
  end
end
