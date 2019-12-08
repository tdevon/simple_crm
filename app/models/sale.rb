class Sale < ApplicationRecord
    belongs_to :user
    belongs_to :contact, optional: true
    validates :user, presence: true
end
