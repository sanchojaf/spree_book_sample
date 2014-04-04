#Spree::Sample.load_sample("tax_categories")
#Spree::Sample.load_sample("shipping_categories")

clothing = Spree::TaxCategory.find_by_name!("Clothing")
shipping_category = Spree::ShippingCategory.find_by_name!("Default")

default_attrs = {
  :available_on => Time.zone.now
}

products = [
  {
    :name => "Refined Spaghetti Strap Cami", #Ruby on Rails Tote
    :tax_category => clothing,
    :shipping_category => shipping_category,
    :price => 15.99,
    :eur_price => 14,
    :description => Faker::Lorem.paragraph,
  },

  {
    :name => "Refined 1.5-inch Scoop Neck Cami", #Ruby on Rails Bag
    :tax_category => clothing,
    :shipping_category => shipping_category,
    :price => 22.99,
    :eur_price => 19,
    :description => Faker::Lorem.paragraph,
  },

  {
    :name => "Refined 1.5-inch Rib-knit Cami", #Ruby on Rails Baseball Jersey
    :tax_category => clothing,
    :shipping_category => shipping_category,
    :price => 19.99,
    :eur_price => 16,
    :description => Faker::Lorem.paragraph,
  },

  {
    :name => "Refined 3-inch Scoop Neck Cami", #Ruby on Rails Jr. Spaghetti
    :tax_category => clothing,
    :shipping_category => shipping_category,
    :price => 19.99,
    :eur_price => 16,
    :description => Faker::Lorem.paragraph,

  },
  {
    :name => "Refined Wrap Cami", #Ruby on Rails Ringer T-Shirt
    :shipping_category => shipping_category,
    :tax_category => clothing,
    :price => 19.99,
    :eur_price => 16,
    :description => Faker::Lorem.paragraph,
  },
  {
    :name => "Refined Matchstick Pant", #Ruby Baseball Jersey
    :tax_category => clothing,
    :shipping_category => shipping_category,
    :price => 19.99,
    :eur_price => 16,
    :description => Faker::Lorem.paragraph,
  },
  {
    :name => "Refined Straight Pant", #Apache Baseball Jersey
    :tax_category => clothing,
    :shipping_category => shipping_category,
    :price => 19.99,
    :eur_price => 16,
    :description => Faker::Lorem.paragraph,
  },
  {
    :name => "Refined Wrap Chemise", #Spree Baseball Jersey
    :tax_category => clothing,
    :shipping_category => shipping_category,
    :price => 19.99,
    :eur_price => 16,
    :description => Faker::Lorem.paragraph,
  },
  {
    :name => "The Jennifer Wrap Jacket", #Spree Jr. Spaghetti
    :tax_category => clothing,
    :shipping_category => shipping_category,
    :price => 19.99,
    :eur_price => 16,
    :description => Faker::Lorem.paragraph,
  },
  {
    :name => "The Carolina Fitted Jacket", #Spree Ringer T-Shirt
    :tax_category => clothing,
    :shipping_category => shipping_category,
    :price => 19.99,
    :eur_price => 16,
    :description => Faker::Lorem.paragraph,
  },
 
]

products.each do |product_attrs|
  eur_price = product_attrs.delete(:eur_price)
  Spree::Config[:currency] = "USD"

  default_shipping_category = Spree::ShippingCategory.find_by_name!("Default")
  product = Spree::Product.create!(default_attrs.merge(product_attrs))
  Spree::Config[:currency] = "EUR"
  product.reload
  product.price = eur_price
  product.shipping_category = default_shipping_category
  product.save!
end

Spree::Config[:currency] = "USD"
