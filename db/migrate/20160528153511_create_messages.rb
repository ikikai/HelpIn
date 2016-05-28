class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :conversation, null: false
      t.text       :text
      t.string     :sender_type

      t.timestamps
    end
  end
end
