class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string :create_goal
      t.date :start_date
      t.date :end_date
      t.boolean :achieved
      t.text :note_goal
      t.references :lives, foreign_key: true

      t.timestamps
    end
  end
end
