class AddSeasonToWeek < ActiveRecord::Migration[5.0]
  def change
    add_column :weeks, :season, :string
  end
end
