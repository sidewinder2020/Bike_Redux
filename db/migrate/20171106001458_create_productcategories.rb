class CreateProductcategories < ActiveRecord::Migration[5.1]
  def change
    create_table :productcategories do |t|
      t.integer :productcategoryid
      t.string :name
      t.integer :rowguid
      t.date :modifieddate

      t.timestamps
    end
  end
end
