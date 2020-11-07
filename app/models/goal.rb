class Goal < ApplicationRecord
  belongs_to :live
  validates_presence_of :create_goal
  validates_presence_of :start_date
  validates_presence_of :end_date
  validates_presence_of :achieved
end
