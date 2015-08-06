class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.date :dob
      t.string :phone
      t.string :email
      t.text :address
      t.boolean :gender
      t.string :desg
      t.float :salary

      t.timestamps null: false
    end
  end
end
