class User < ApplicationRecord
  enum role: %I[user admin]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :validatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, authentication_keys: %I[username]
  validates :username, presence: true, uniqueness: true
  validates :full_name, presence: true, uniqueness: true
  validates :role, presence: true
  has_many :albums, dependent: :destroy
end
