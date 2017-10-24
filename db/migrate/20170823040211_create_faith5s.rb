class CreateFaith5s < ActiveRecord::Migration[5.0]
  def change
    create_table :faith5s do |t|
      t.text :share
      t.text :talk
      t.text :pray
      t.text :bless
      t.text :read
      t.references :week, foreign_key: true

      t.timestamps
    end
  end
end
