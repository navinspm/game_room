class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  after_create_commit :broadcast_to_room
  
  def is_last?
    self.id == self.room.messages.last.id
  end

  private
    def broadcast_to_room
      broadcast_append_to self.room
    end

end
