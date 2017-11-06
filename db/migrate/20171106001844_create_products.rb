class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.numeric :standardcost
      t.numeric :listprice
      t.integer :daystomanufacture
      t.references :productsubcategory, foreign_key: true
      t.date :sellstartdate
      t.date :sellenddate
      t.date :discontinueddate
      t.string :rowguid
      t.date :modifieddate

      t.timestamps
    end
  end
end
