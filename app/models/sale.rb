class Sale < ApplicationRecord
    belongs_to :user
    belongs_to :contact, optional: true
    validates :user, presence: true
    validates :price, presence: true
    validates :title, presence: true
    validates :description, presence: true
end
