class Contact < ApplicationRecord
  belongs_to :user
  has_many :sales
  has_many :touchpoints
  accepts_nested_attributes_for :touchpoints

  validates :user, presence: true
  
  validates :name, presence: true, uniqueness: {
                                      case_sensitive: false, 
                                      message: "Theres already a contact with that name!"}

  validates :phone, allow_blank: true, uniqueness: {
                                          case_sensitive: false, 
                                          message: "Theres already a contact with that number!"}

  validates :email, allow_blank: true, uniqueness: {
                                  case_sensitive: false, 
                                  message: "Theres already a contact with that email!"}
                                  
end
