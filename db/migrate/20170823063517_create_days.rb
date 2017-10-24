class CreateDays < ActiveRecord::Migration[5.0]
  def change
    create_table :days do |t|
      t.datetime :date
      t.string :day_of_week
      t.string :verse
      t.string :title
      t.references :reading_list, foreign_key: true

      t.timestamps
    end
  end
end
