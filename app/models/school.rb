class School < ApplicationRecord
  validates :coords, presence: true
end
