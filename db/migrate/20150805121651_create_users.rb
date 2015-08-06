class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :name
    	t.date :dob
    	t.integer :phone
    	t.string :email
    	t.text :address
    	t.string :gender
    	t.string :designation
    	t.float :salary
      t.timestamps null: false
    end
  end
end
