class CreateSalesterritories < ActiveRecord::Migration[5.1]
  def change
    create_table :salesterritories do |t|
      t.string :name
      t.string :countryregioncode
      t.string :group
      t.numeric :salesytd
      t.numeric :saleslastyear
      t.string :rowguid
      t.date :modifieddate

      t.timestamps
    end
  end
end
