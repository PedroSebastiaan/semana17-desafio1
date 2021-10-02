class CatalogController < ApplicationController
  before_action :authenticate_user!
  def index
    @variants = Variant.all
    @categories = Category.all
    @products = Product.all
  end

  def show
    @variant_to_show = Variant.find(params[:id])
    @variants = Variant.where(product_id: @variant_to_show.product_id)
    @categories = Category.all
    @products = Product.all
  end

  def show_sizes
    @variant_to_show = Variant.find(params[:id])
    @variants = Variant.where(product_id: @variant_to_show.product_id, color_id: @variant_to_show.color_id)
    @categories = Category.all
    @products = Product.all
  end
end
