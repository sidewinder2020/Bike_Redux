class CreateSalespeople < ActiveRecord::Migration[5.1]
  def change
    create_table :salespeople do |t|
      t.integer :businessentitid
      t.references :salesterritory, foreign_key: true
      t.numeric :bonus
      t.numeric :commissionpct
      t.numeric :salesytd
      t.numeric :saleslastyear
      t.string :rowguid
      t.date :modifieddate

      t.timestamps
    end
  end
end
