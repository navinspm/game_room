class MessagesController < ApplicationController

    before_action :set_room, only: %i[ create ]
    def create
      @current_user = current_user
      @current_user.messages.create(content: msg_params[:content], room_id: params[:room_id])
    end
  
    private
    
    
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:room_id])
    end

    def msg_params
      params.require(:message).permit(:content)
    end
  end