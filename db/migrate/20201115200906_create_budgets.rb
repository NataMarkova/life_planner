class CreateBudgets < ActiveRecord::Migration[5.2]
  def change
    create_table :budgets do |t|
      t.string :expected_income
      t.integer :expected_incom_amount
      t.string :expected_expences
      t.integer :expected_expences_amount
      t.integer :expected_diff
      t.string :actual_income
      t.integer :actual_income_amount
      t.string :actual_expences
      t.integer :actual_expences_amount
      t.integer :actual_diff
      t.references :lives, foreign_key: true

      t.timestamps
    end
  end
end
