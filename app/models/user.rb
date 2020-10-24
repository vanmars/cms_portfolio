class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_many :comments, dependent: :destroy

  # Validations
  validates :first_name, :last_name, :username, :email, :password, :admin, presence: true
end
