#Spree::Sample.load_sample("tax_categories")
#Spree::Sample.load_sample("shipping_categories")

clothing = Spree::TaxCategory.find_by_name!("Clothing")
shipping_category = Spree::ShippingCategory.find_by_name!("Default")

default_attrs = {
  :available_on => Time.zone.now
}

products = [
  {
    :name => "Ruby on Rails Tote",
    :tax_category => clothing,
    :shipping_category => shipping_category,
    :price => 15.99,
    :eur_price => 14,
    :description => Faker::Lorem.paragraph,
  },
  {
    :name => "Ruby on Rails Bag",
    :tax_category => clothing,
    :shipping_category => shipping_category,
    :price => 22.99,
    :eur_price => 19,
    :description => Faker::Lorem.paragraph,
  },
  {
    :name => "FC-16",
    :tax_category => clothing,
    :shipping_category => shipping_category,
    :price => 19.99,
    :eur_price => 16,
    :description => "Compared to most ordinary sailboats, our revolutionary Patent Pending Folding Hull Technology      makes a portable 16ft catamaran which can be checked on a plane, stored under a bed, or raced in virtually any body of water.Every component breaks into sections that are less that 4ft long, allowing you to fit the entire sailboat into 2 large suitcases, with an estimated size of 4 x 3.5 x 1.25 each. With an estimated weight of 75 lbs (~34 kg) per suitcase, we put large wheels on the bottom for easy transport.The suitcases can be attached together for single person travel, or kept apart for sharing the load, airline use, or storing it under your bed",
  },
  {
    :name => "Ruby on Rails Jr. Spaghetti",
    :tax_category => clothing,
    :shipping_category => shipping_category,
    :price => 19.99,
    :eur_price => 16,
    :description => Faker::Lorem.paragraph,

  },
  {
    :name => "Ruby on Rails Ringer T-Shirt",
    :shipping_category => shipping_category,
    :tax_category => clothing,
    :price => 19.99,
    :eur_price => 16,
    :description => Faker::Lorem.paragraph,
  },
  {
    :name => "Ruby Baseball Jersey",
    :tax_category => clothing,
    :shipping_category => shipping_category,
    :price => 19.99,
    :eur_price => 16,
    :description => Faker::Lorem.paragraph,
  },
  {
    :name => "Apache Baseball Jersey",
    :tax_category => clothing,
    :shipping_category => shipping_category,
    :price => 19.99,
    :eur_price => 16,
    :description => Faker::Lorem.paragraph,
  },
  {
    :name => "Spree Baseball Jersey",
    :tax_category => clothing,
    :shipping_category => shipping_category,
    :price => 19.99,
    :eur_price => 16,
    :description => Faker::Lorem.paragraph,
  },
  {
    :name => "Spree Jr. Spaghetti",
    :tax_category => clothing,
    :shipping_category => shipping_category,
    :price => 19.99,
    :eur_price => 16,
    :description => Faker::Lorem.paragraph,
  },
  {
    :name => "Spree Ringer T-Shirt",
    :tax_category => clothing,
    :shipping_category => shipping_category,
    :price => 19.99,
    :eur_price => 16,
    :description => Faker::Lorem.paragraph,
  },
  {
    :name => "Spree Tote",
    :tax_category => clothing,
    :shipping_category => shipping_category,
    :price => 15.99,
    :eur_price => 14,
    :description => Faker::Lorem.paragraph,
  },
  {
    :name => "Spree Bag",
    :tax_category => clothing,
    :shipping_category => shipping_category,
    :price => 22.99,
    :eur_price => 19,
    :description => Faker::Lorem.paragraph,
  },
  {
    :name => "Ruby on Rails Mug",
    :shipping_category => shipping_category,
    :price => 13.99,
    :eur_price => 12,
    :description => Faker::Lorem.paragraph,
  },
  {
    :name => "Ruby on Rails Stein",
    :shipping_category => shipping_category,
    :price => 16.99,
    :eur_price => 14,
    :description => Faker::Lorem.paragraph,
  },
  {
    :name => "Spree Stein",
    :shipping_category => shipping_category,
    :price => 16.99,
    :eur_price => 14,
    :description => Faker::Lorem.paragraph,
  },
  {
    :name => "Spree Mug",
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
