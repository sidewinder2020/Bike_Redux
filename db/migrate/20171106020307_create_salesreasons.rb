class CreateSalesreasons < ActiveRecord::Migration[5.1]
  def change
    create_table :salesreasons do |t|
      t.string :name
      t.string :reasontype
      t.date :modifieddate

      t.timestamps
    end
  end
end
