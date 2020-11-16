class Budget < ApplicationRecord
  has_one :lives
  # delegate :life_name, to: :life, prefix: true, allow_nil: true
end
