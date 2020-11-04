class CreateLives < ActiveRecord::Migration[5.2]
  def change
    create_table :lives do |t|
      t.string :life_category
      t.string :life_name
      t.text :life_activity

      t.timestamps
    end
  end
end
