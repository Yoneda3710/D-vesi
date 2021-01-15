class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :producer,  null: false, foreign_key: true
      t.references :customer,  null: false, foreign_key: true
      t.references :item,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
