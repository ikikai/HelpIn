class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string     :name
      t.string     :nickname, unique: true
      t.string     :email,    unique: true
      t.string     :gender
      t.integer    :age
      t.date       :birthday
      t.string     :city
      t.string     :problem_category
      t.references :expert, null: false

      t.timestamps
    end
  end
end
