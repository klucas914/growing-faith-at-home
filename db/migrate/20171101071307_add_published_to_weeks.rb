class AddPublishedToWeeks < ActiveRecord::Migration[5.0]
  def change
    add_column :weeks, :published, :boolean, default: false
  end
end
