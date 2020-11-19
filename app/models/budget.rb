class Budget < ApplicationRecord
  validates :expected_income_amount, presence: true
  validates :expected_income_amount, numericality: { only_integer: true }
  validates :actual_income_amount, presence: true
  validates :actual_income_amount, numericality: { only_integer: true }
  validates :actual_diff, presence: true
  validates :actual_diff, numericality: { only_integer: true }
  belongs_to :life
end