class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :projects, dependent: :destroy

  # Validations
  validates :email, :password, presence: true
end
