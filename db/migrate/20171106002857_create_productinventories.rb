class CreateProductinventories < ActiveRecord::Migration[5.1]
  def change
    create_table :productinventories do |t|
      t.references :product, foreign_key: true
      t.integer :quantity
      t.integer :rowguid
      t.date :modifieddate

      t.timestamps
    end
  end
end
