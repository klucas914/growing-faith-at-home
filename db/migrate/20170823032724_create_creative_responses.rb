class CreateCreativeResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :creative_responses do |t|
      t.text :response
      t.references :week, foreign_key: true

      t.timestamps
    end
  end
end
