class Life < ApplicationRecord
    # belongs_to :goal
    # has_one :budget 
    validates :life_category, presence: true
    validates :life_name, presence: true

end
