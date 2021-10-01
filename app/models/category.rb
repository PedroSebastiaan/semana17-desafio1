class Category < ApplicationRecord
  has_and_belongs_to_many :products

  # scope :parents -> {where(parent_id: nil)} 

  def category_levels(id)
    categories = Category.all
    first_lvl= []
    second_lvl = []
    third_lvl = []
    categories.map do |category|
      if category.category_id == nil
        first_lvl << category
      else
        if first_lvl.find(category.category_id)
          second_lvl << category
        else
          third_lvl << category
        end
      end
    end
  end
  
end
