class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :slug
      t.string :image
      t.string :description
      t.boolean :active
      t.boolean :highlight
      t.boolean :is_deleted
      t.belongs_to :item_category, index: true
      t.timestamps
    end
  end
end
