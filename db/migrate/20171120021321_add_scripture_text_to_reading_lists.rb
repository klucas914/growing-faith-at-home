class AddScriptureTextToReadingLists < ActiveRecord::Migration[5.0]
  def change
    add_column :reading_lists, :scripture_text, :text
  end
end
