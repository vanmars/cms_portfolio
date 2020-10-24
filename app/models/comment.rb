class Comment < ApplicationRecord
  # Associations
  belongs_to :post
  belongs_to :user

  # Validations
  validates :body, presence: true
end