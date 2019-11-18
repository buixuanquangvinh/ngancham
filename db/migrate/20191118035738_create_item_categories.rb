class CreateItemCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :item_categories do |t|
      t.string :name
      t.string :description
      t.string :image
      t.string :slug
      t.boolean :active
      t.timestamps
    end
  end
end
