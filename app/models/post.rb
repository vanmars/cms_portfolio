class Post < ApplicationRecord
  # Associations
  has_many :comments, dependent: :destroy

  # Active Storage
  has_one_attached :image
end