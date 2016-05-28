class CreateExperts < ActiveRecord::Migration
  def change
    create_table :experts do |t|
      t.string     :name
      t.string     :email, unique: true
      t.text       :bio
      t.string     :specialization
      t.decimal    :rating

      t.timestamps
    end
  end
end
