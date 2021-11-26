class CreateOderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :oder_details do |t|
      t.integer "item_id"
      t.integer "order_id"
      t.integer "price"
      t.integer "amount"
      t.integer "making_status"
      t.timestamps
    end
  end
end
