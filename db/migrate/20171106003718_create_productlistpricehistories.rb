class CreateProductlistpricehistories < ActiveRecord::Migration[5.1]
  def change
    create_table :productlistpricehistories do |t|
      t.references :product, foreign_key: true
      t.date :startdate
      t.date :enddate
      t.numeric :listprice
      t.date :modifieddate

      t.timestamps
    end
  end
end
