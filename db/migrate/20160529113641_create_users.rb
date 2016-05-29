class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string     :name
      t.string     :nickname, unique: true
      t.string     :email,    unique: true
      t.string     :gender
      t.integer    :age
      t.date       :birthday
      t.string     :city
      t.string     :problem_category
      t.boolean    :admin
      t.text       :bio
      t.decimal    :rating
      t.string     :specialization

      t.timestamps
    end
  end
end
