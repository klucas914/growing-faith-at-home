class CreateServiceIdeas < ActiveRecord::Migration[5.0]
  def change
    create_table :service_ideas do |t|
      t.text :idea
      t.references :week, foreign_key: true

      t.timestamps
    end
  end
end
