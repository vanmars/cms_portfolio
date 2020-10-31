class Project < ApplicationRecord
  # Active Storage Image
  has_one_attached :image

  # Validations
  validates :title, :description, presence: true
end