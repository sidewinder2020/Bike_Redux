class CreateSalesorderheadersalesreasons < ActiveRecord::Migration[5.1]
  def change
    create_table :salesorderheadersalesreasons do |t|
      t.references :salesorderheader, foreign_key: true
      t.references :salesreason, foreign_key: true
      t.date :modifieddate

      t.timestamps
    end
  end
end
