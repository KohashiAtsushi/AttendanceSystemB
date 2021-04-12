class BasePoint < ApplicationRecord
  validates :point_name, presence: true
  validates :point_number, length: { maximum: 8 }
  validates :point_type, length: { maximum: 8 }
end