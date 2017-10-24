class CreateSeasons < ActiveRecord::Migration[5.0]
  def change
    create_table :seasons do |t|
      t.string :church_season
      t.text :description
      t.references :week, foreign_key: true

      t.timestamps
    end
  end
end
