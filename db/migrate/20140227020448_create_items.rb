class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :item
      t.references :list, index: true

      t.timestamps
    end
      add_index :item, :list_id
  end
end
