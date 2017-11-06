class CreateProductinventories < ActiveRecord::Migration[5.1]
  def change
    create_table :productinventories, {id: false} do |t|
      t.bigint :id
      t.bigint :productid
      t.string :rowguid
      t.date :modifieddate

      t.timestamps
    end
  end
end
