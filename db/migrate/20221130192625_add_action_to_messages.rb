class AddActionToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :action, :string
  end
end
