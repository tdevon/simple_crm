class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :contacts, inverse_of: :user
  has_many :sales, inverse_of: :user
  has_many :touchpoints, through: :contacts
end
