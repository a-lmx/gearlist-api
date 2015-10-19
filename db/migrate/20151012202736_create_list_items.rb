class CreateListItems < ActiveRecord::Migration
  def change
    create_table :list_items do |t|
      t.integer :item_id
      t.integer :list_id
      t.integer :quantity
      t.string :section

      t.timestamps null: false
    end
  end
end
