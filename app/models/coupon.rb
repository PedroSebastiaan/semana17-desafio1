class Coupon < ApplicationRecord
    has_many :user_discounts
    has_many :users, through: :user_discounts
end
