class CreateProductsubcategories < ActiveRecord::Migration[5.1]
  def change
    create_table :productsubcategories do |t|
      t.references :productcategory, foreign_key: true
      t.string :name
      t.string :rowguid
      t.date :modifieddate

      t.timestamps
    end
  end
end
