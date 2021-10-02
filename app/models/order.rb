class Order < ApplicationRecord
  before_create -> { generate_number(hash_size) }

  belongs_to :user

  has_many :order_items
  has_many :variants, through: :order_items
  has_many :payments

  validates :number, uniqueness: true

  def generate_number(size)
    self.number ||= loop do
      random = random_candidate(size)
      break random unless self.class.exists?(number: random)
    end
  end

  def random_candidate(size)
    "#{hash_prefix}#{Array.new(size){rand(size)}.join}"
  end

  def hash_prefix
    "BO"
  end

  def hash_size
    9
  end

  def add_product(variant_id, quantity)
    variant = Variant.find(variant_id)
    if variant && (variant.stock > 0)
      order_items.create(variant_id: variant.id, quantity: quantity, price: Product.find(variant.product_id).price)
      compute_total
    end
  end

  def compute_total
    sum = 0
    order_items.each do |item|
      sum += item.price
    end
    update_attribute(:total, sum)
  end
end
