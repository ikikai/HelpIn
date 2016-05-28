class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.references :client, null: false
      t.references :expert, null: false
    end
  end
end
