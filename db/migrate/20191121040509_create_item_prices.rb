class CreateItemPrices < ActiveRecord::Migration[6.0]
  def change
    create_table :item_prices do |t|
      t.string :name
      t.integer :price
      t.belongs_to :item, index: true
      t.timestamps
    end
  end
end
