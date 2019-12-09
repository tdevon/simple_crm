class Touchpoint < ApplicationRecord
  belongs_to :contact
  belongs_to :user

  validates :date, presence: true
  validates :title, presence: true
  validates :details, presence: true
  validates :user, presence: true
  validates :contact, presence: true
end
