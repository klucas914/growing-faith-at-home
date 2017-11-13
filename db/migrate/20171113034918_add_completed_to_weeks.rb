class AddCompletedToWeeks < ActiveRecord::Migration[5.0]
  def change
    add_column :weeks, :completed, :boolean, default: false
  end
end
