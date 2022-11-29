class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :host_id
      t.string :player_id

      t.timestamps
    end
  end
end
