class PlantTag < ApplicationRecord
  belongs_to :plant
  belongs_to :tag
  validates :description, presence: true
end
