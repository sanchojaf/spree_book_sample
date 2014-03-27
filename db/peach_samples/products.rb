#Spree::Sample.load_sample("tax_categories")
#Spree::Sample.load_sample("shipping_categories")

clothing = Spree::TaxCategory.find_by_name!("Clothing")
shipping_category = Spree::ShippingCategory.find_by_name!("Default")

default_attrs = {
  :available_on => Time.zone.now
}

products = [
  {
    :name => "Plunge", #Ruby on Rails Tote
    :tax_category => clothing,
    :shipping_category => shipping_category,
    :price => 15.99,
    :eur_price => 14,
    :description => Faker::Lorem.paragraph,
  },
  {
    :name => "Sleeveless Tee", #Ruby on Rails Bag
    :tax_category => clothing,
    :shipping_category => shipping_category,
    :price => 22.99,
    :eur_price => 19,
    :description => Faker::Lorem.paragraph,
  },
  {
    :name => "Full", #Ruby on Rails Baseball Jersey
    :tax_category => clothing,
    :shipping_category => shipping_category,
    :price => 19.99,
    :eur_price => 16,
    :description => Faker::Lorem.paragraph,
  },
  {
    :name => "Spaghetti Strap Cami", #Ruby on Rails Jr. Spaghetti
    :tax_category => clothing,
    :shipping_category => shipping_category,
    :price => 19.99,
    :eur_price => 16,
    :description => Faker::Lorem.paragraph,

  },
  {
    :name => "Ribbed-knit Tank", #Ruby on Rails Ringer T-Shirt
    :shipping_category => shipping_category,
    :tax_category => clothing,
    :price => 19.99,
    :eur_price => 16,
    :description => Faker::Lorem.paragraph,
  },
  {
    :name => "Wrap Chemise", #Ruby Baseball Jersey
    :tax_category => clothing,
    :shipping_category => shipping_category,
    :price => 19.99,
    :eur_price => 16,
    :description => Faker::Lorem.paragraph,
  },
  {
    :name => "Wrap Cami", #Apache Baseball Jersey
    :tax_category => clothing,
    :shipping_category => shipping_category,
    :price => 19.99,
    :eur_price => 16,
    :description => Faker::Lorem.paragraph,
  },
  {
    :name => "Flyaway Jacket", #Spree Baseball Jersey
    :tax_category => clothing,
    :shipping_category => shipping_category,
    :price => 19.99,
    :eur_price => 16,
    :description => Faker::Lorem.paragraph,
  },
  {
    :name => "Scoop Neck Cami", #Spree Jr. Spaghetti
    :tax_category => clothing,
    :shipping_category => shipping_category,
    :price => 19.99,
    :eur_price => 16,
    :description => Faker::Lorem.paragraph,
  },
  {
    :name => "Everyday Jacket", #Spree Ringer T-Shirt
    :tax_category => clothing,
    :shipping_category => shipping_category,
    :price => 19.99,
    :eur_price => 16,
    :description => Faker::Lorem.paragraph,
  },
  {
    :name => "Relaxed Legging", #Spree Tote
    :tax_category => clothing,
    :shipping_category => shipping_category,
    :price => 15.99,
    :eur_price => 14,
    :description => Faker::Lorem.paragraph,
  },
  {
    :name => "Everyday Pant", #Spree Bag
    :tax_category => clothing,
    :shipping_category => shipping_category,
    :price => 22.99,
    :eur_price => 19,
    :description => Faker::Lorem.paragraph,
  },
  {
    :name => "Bikini", #Ruby on Rails Mug
    :shipping_category => shipping_category,
    :price => 13.99,
    :eur_price => 12,
    :description => Faker::Lorem.paragraph,
  },
  {
    :name => "Thong", #Ruby on Rails Stein
    :shipping_category => shipping_category,
    :price => 16.99,
    :eur_price => 14,
    :description => Faker::Lorem.paragraph,
  },
  {
    :name => "Girlshort", #Spree Stein
    :shipping_category => shipping_category,
    :price => 16.99,
    :eur_price => 14,
    :description => Faker::Lorem.paragraph,
  },
  {
    :name => "Brief", #Spree Mug
    :shipping_category => shipping_category,
    :price => 13.99,
    :eur_price => 12,
    :description => Faker::Lorem.paragraph,
  }
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
