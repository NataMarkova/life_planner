class CreateBudgets < ActiveRecord::Migration[5.2]
  def change
    create_table :budgets do |t|
      t.integer :expected_income_amount
      t.integer :actual_income_amount
      t.integer :actual_diff
      t.references :life, foreign_key: true

      t.timestamps
    end
  end
end
