class CreateProductsubcategories < ActiveRecord::Migration[5.1]
  def change
    create_table :productsubcategories do |t|
      t.integer :productsubcategoryid
      t.references :productcategory, foreign_key: true
      t.string :name
      t.integer :rowguid
      t.date :modifieddate

      t.timestamps
    end
  end
end
