class CreateMemoryVerses < ActiveRecord::Migration[5.0]
  def change
    create_table :memory_verses do |t|
      t.text :text
      t.string :verse_address
      t.references :week, foreign_key: true

      t.timestamps
    end
  end
end
