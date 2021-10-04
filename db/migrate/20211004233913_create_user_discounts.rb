class CreateUserDiscounts < ActiveRecord::Migration[5.2]
  def change
    create_table :user_discounts do |t|
      t.references :coupon, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
