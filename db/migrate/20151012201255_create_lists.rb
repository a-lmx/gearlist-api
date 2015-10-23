class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.string :description
      t.integer :user_id
      t.boolean :secret, null: false, default: false

      t.timestamps null: false
    end
  end
end
