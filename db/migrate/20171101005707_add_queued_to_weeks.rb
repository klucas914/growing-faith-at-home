class AddQueuedToWeeks < ActiveRecord::Migration[5.0]
  def change
    add_column :weeks, :queued, :boolean, default: false
  end
end
