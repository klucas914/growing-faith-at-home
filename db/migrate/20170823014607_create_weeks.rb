class CreateWeeks < ActiveRecord::Migration[5.0]
  def change
    create_table :weeks do |t|
      t.string :name
      t.datetime :published_on
      t.datetime :archived_on

      t.timestamps
    end
  end
end
