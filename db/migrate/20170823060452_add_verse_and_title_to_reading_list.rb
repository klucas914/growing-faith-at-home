class AddVerseAndTitleToReadingList < ActiveRecord::Migration[5.0]
  def change
    add_column :reading_lists, :verse, :string
    add_column :reading_lists, :title, :string
  end
end
