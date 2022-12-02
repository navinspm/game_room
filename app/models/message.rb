class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  after_create_commit :broadcast_to_room
  
  def is_last?
    self.id == self.room.messages.last.id
  end

  private
    def broadcast_to_room
      if self.action == 'show' && self.is_last? 
        broadcast_append_to  [self.room.player, "messages"], target: "messages", partial: "messages/message"
      elsif self.action == 'selected' && self.is_last?
        broadcast_append_to  [self.room.host, "messages"], target: "messages", partial: "messages/message"
        broadcast_replace_to  [self.room.host, "show_button"], target: "show_button", partial: "rooms/show_button_form", locals: { room: self.room_id }
      end
    end

end
