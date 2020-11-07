class Life < ApplicationRecord
    validates :life_category, presence: true
    validates :life_name, presence: true
    has_many :lives
end
