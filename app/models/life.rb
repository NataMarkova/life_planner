class Life < ApplicationRecord
    # belongs_to :goal
    # has_many :budget
    # has_many :goal  
    validates :life_category, presence: true
    validates :life_name, presence: true

end
