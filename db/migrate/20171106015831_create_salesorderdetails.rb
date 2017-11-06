class CreateSalesorderdetails < ActiveRecord::Migration[5.1]
  def change
    create_table :salesorderdetails do |t|
      t.references :salesorderheader, foreign_key: true
      t.integer :orderqty
      t.references :product, foreign_key: true
      t.numeric :unitprice
      t.string :rowguid
      t.date :modifieddate

      t.timestamps
    end
  end
end
