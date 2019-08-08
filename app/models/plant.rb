class Plant < ApplicationRecord
  belongs_to :garden
  validates :name, presence: true
  has_many :plant_tags
end
