class ApplicationController < ActionController::Base

  def current_order
    if current_user
      order = Order.where(user_id: current_user.id).where(state: "created").last
      if order.nil?
        order = Order.create(user: current_user, state: "created")
      end
      return order
    end

    nil
  end

  def discount (order, coupon)
    if coupon.porcentual_discount != nil
      order.total = @order.total*((100-coupon.porcentual_discount)/100)
    elsif coupon.money_discount != nil
      if order.total = @order.total - coupon.money_dicount > 0
        order.total = @order.total - coupon.money_dicount
      else
        order.total = 0
      end
    end
  end

  def use_coupon (coupon)
    if User.find(id: current_user.id).user_discounts.find(coupon_id: coupon.id) == nil
      User.find(id: current_user.id).user_discounts.create(coupon_id: coupon.id)
      redirect_to cart_path, notice: "Discount applied"
    else
      redirect_to cart_path, notice: "You already use this coupon"
    end
  end
end
