class CreateListSections < ActiveRecord::Migration
  def change
    create_table :list_sections do |t|
      t.integer :list_id
      t.integer :section_id

      t.timestamps null: false
    end
  end
end
