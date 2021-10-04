class UserDiscount < ApplicationRecord
  belongs_to :coupon
  belongs_to :user
end
