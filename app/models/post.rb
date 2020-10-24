class Post < ApplicationRecord
  # Associations
  has_many :comments, dependent: :destroy

  # Active Storage
  has_one_attached :image

  # Validations
  validates :title, :body, presence: true

  # Scopes
  scope :newest, -> { order(created_at: :desc) }
  scope :oldest, -> { order(created_at: :asc) }
end