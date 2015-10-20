class CreateListSectionItems < ActiveRecord::Migration
  def change
    create_table :list_section_items do |t|
      t.integer :item_id
      t.integer :list_section_id
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
