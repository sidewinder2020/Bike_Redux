class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table :stores do |t|
      t.string :name
      t.references :salesperson, foreign_key: true
      t.string :rowguid
      t.date :modifieddate

      t.timestamps
    end
  end
end
