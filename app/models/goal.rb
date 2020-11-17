class Goal < ApplicationRecord
  validates :create_goal, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :achieved, presence: true
  has_many :lives
end