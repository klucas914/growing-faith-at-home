class CreateBlesses < ActiveRecord::Migration[5.0]
  def change
    create_table :blesses do |t|
      t.text :blessing
      t.references :week, foreign_key: true

      t.timestamps
    end
  end
end
