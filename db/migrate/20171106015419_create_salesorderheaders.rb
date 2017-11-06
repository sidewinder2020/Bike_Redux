class CreateSalesorderheaders < ActiveRecord::Migration[5.1]
  def change
    create_table :salesorderheaders do |t|
      t.date :orderdate
      t.integer :status
      t.boolean :onlineorderflag
      t.integer :customerid
      t.references :salesperson, foreign_key: true
      t.references :salesterritory, foreign_key: true
      t.integer :currencyrateid
      t.numeric :totaldue
      t.string :rowguid
      t.date :modifieddate

      t.timestamps
    end
  end
end
