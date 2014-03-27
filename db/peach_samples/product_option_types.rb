#Spree::Sample.load_sample("products")

size = Spree::OptionType.find_by_presentation!("Size")
color = Spree::OptionType.find_by_presentation!("Color")

products = Spree::Product.all

products.each do |product|
  product.option_types = [size, color]
  product.save!
end


