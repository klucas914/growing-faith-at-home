class CreateReadingLists < ActiveRecord::Migration[5.0]
  def change
    create_table :reading_lists do |t|
      t.datetime :day
      t.references :week, foreign_key: true

      t.timestamps
    end
  end
end
