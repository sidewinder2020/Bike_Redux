class CreateProductreviews < ActiveRecord::Migration[5.1]
  def change
    create_table :productreviews do |t|
      t.integer :productreviewid
      t.references :product, foreign_key: true
      t.string :reviewername
      t.integer :rating
      t.string :comments
      t.date :modifieddate

      t.timestamps
    end
  end
end
