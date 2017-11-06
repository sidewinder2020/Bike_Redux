class CreateProductcategories < ActiveRecord::Migration[5.1]
  def change
    create_table :productcategories do |t|
      t.string :name
      t.string :rowguid
      t.date :modifieddate

      t.timestamps
    end
  end
end
