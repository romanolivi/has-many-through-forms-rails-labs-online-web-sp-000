class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories
  

#   def categories_attributes=(category_attributes)
#     category_attributes.values.each do |category_attribute|
#       category = Category.find_or_create_by(category_attribute)
#       self.categories << category 
#     end
#   end
  
# end 
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  def categories_attributes=(category_attributes)
    category_attributes.each do |i, category_attributes|
      if category_attributes[:name].present?
      category = Category.find_or_create_by(name: category_attributes[:name])
        if !self.categories.include?(category)
          self.post_categories.build(:category => category)
        end
      end


    end
  end
end



  # def categories_attributes=(category_attributes)
  #   category_attributes.values.each do |category_attribute|
  #     if !category_attribute[:name].empty?
  #       category = Category.find_or_create_by(name: category_attributes[:name])
  #     category = Category.find_or_create_by(category_attribute)
  #     end

  #     if !self.post_categories.include?(category)
  #       self.post_categories.build(:category => category)
  #     end
  #   end
  # end