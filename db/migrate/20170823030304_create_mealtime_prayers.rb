class CreateMealtimePrayers < ActiveRecord::Migration[5.0]
  def change
    create_table :mealtime_prayers do |t|
      t.text :mealtime_prayer
      t.references :week, foreign_key: true

      t.timestamps
    end
  end
end
