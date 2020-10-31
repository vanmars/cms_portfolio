class Project < ApplicationRecord
  # Active Storage Image
  has_one_attached :image

  # Associations
  belongs_to :user

  # Validations
  validates :title, :description, presence: true
end