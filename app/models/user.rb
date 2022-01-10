class User < ApplicationRecord
  enum role: [:user, :admin ]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :validatable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, authentication_keys: [:username]

  # def email_required?
  #   false
  # end

  # def email_changed?
  #   false
  # end
  
  validates :username, presence: true, uniqueness: true
  validates :full_name, presence: true, uniqueness: true
  validates :role, presence: true

  has_many :albums, dependent: :destroy
  
end
