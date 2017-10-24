class CreatePrays < ActiveRecord::Migration[5.0]
  def change
    create_table :prays do |t|
      t.text :prayer
      t.references :week, foreign_key: true

      t.timestamps
    end
  end
end
