class MessagesController < ApplicationController

    before_action :set_room, only: %i[ create ]
    def create
      @current_user = current_user
      @current_user.messages.create(content: msg_params[:content], room_id: params[:room_id])
    end

    def show_button
      Message.create(action: 'show', room_id: params[:room_id], user_id: current_user.id)
    end

    def image_selection
      Message.create(action: 'selected', room_id: params[:room_id], user_id: current_user.id, selected: params[:id])
    end
  
    private
    
    
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:room_id])
    end


    def msg_params
      params.require(:message).permit(:content, :room_id)
    end
  end