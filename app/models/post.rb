class Post < ApplicationRecord
  # Associations
  has_many :comments, dependent: :destroy
  belongs_to :user

  # Active Storage
  has_one_attached :image

  # Validations
  validates :title, :body, presence: true

  # Scopes
  scope :newest, -> { order(created_at: :desc) }
  scope :oldest, -> { order(created_at: :asc) }
  scope :most_comments, -> {( 
    select('posts.*, count(comments.id) as comments_count')
    .joins(:comments)
    .group('posts.id')
    .order('comments_count DESC')
  )}
end