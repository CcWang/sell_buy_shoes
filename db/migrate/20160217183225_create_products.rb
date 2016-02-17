class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.date :post_date
      t.date :bought_date
      t.float :amount
      t.references :buyer, index: true, foreign_key: true
      t.references :seller, index: true, foreign_key: true

      t.timestamps
    end
  end
end
