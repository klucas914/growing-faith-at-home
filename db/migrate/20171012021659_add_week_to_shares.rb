class AddWeekToShares < ActiveRecord::Migration[5.0]
  def change
    add_reference :shares, :week, foreign_key: true
  end
end
