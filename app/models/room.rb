class Room < ApplicationRecord
    belongs_to :host, :foreign_key => 'host_id', class_name: "User",optional: true
    belongs_to :player, :foreign_key => 'player_id', class_name: "User", optional: true
end
