#Spree::Sample.load_sample("tax_categories")
#Spree::Sample.load_sample("shipping_categories")

clothing = Spree::TaxCategory.find_by_name!("Clothing")
shipping_category = Spree::ShippingCategory.find_by_name!("Default")

default_attrs = {
  :available_on => Time.zone.now
}

products = [
  {
    :name => "Refined Spaghetti Strap Cami", 
    :tax_category => clothing,
    :shipping_category => shipping_category,
    :price => 40,
    :description => "Refined Spaghetti Strap Cami",
  },

  {
    :name => "Refined 1.5-inch Scoop Neck Cami", 
    :tax_category => clothing,
    :shipping_category => shipping_category,
    :price => 50,
    :description => "Refined 1.5-inch Scoop Neck Cami",
  },

  {
    :name => "Refined 1.5-inch Rib-knit Cami", 
    :tax_category => clothing,
    :shipping_category => shipping_category,
    :price => 30,
    :description => "Refined 1.5-inch Rib-knit Cami",
  },

  {
    :name => "Refined 3-inch Scoop Neck Cami", 
    :tax_category => clothing,
    :shipping_category => shipping_category,
    :price => 50,
    :description => "Refined 3-inch Scoop Neck Cami",

  },
  {
    :name => "Refined Wrap Cami", 
    :shipping_category => shipping_category,
    :tax_category => clothing,
    :price => 55,
    :description => "Refined Wrap Cami",
  },
  {
    :name => "Refined Matchstick Pant", 
    :tax_category => clothing,
    :shipping_category => shipping_category,
    :price => 60,
    :description => "Refined Matchstick Pant",
  },
  {
    :name => "Refined Straight Pant", 
    :tax_category => clothing,
    :shipping_category => shipping_category,
    :price => 60,
    :description => "Refined Straight Pant",
  },
  {
    :name => "Refined Wrap Chemise", 
    :tax_category => clothing,
    :shipping_category => shipping_category,
    :price => 65,
    :description => "Refined Straight Pant",
  },
  {
    :name => "The Jennifer Wrap Jacket",
    :tax_category => clothing,
    :shipping_category => shipping_category,
    :price => 90,
    :description => "Refined Straight Pant",
  },
  {
    :name => "The Carolina Fitted Jacket", 
    :tax_category => clothing,
    :shipping_category => shipping_category,
    :price => 110,
    :description => "Refined Straight Pant",
  },
 
]

products.each do |product_attrs|
  Spree::Config[:currency] = "USD"
  default_shipping_category = Spree::ShippingCategory.find_by_name!("Default")
  product = Spree::Product.create!(default_attrs.merge(product_attrs))
  product.reload
  product.shipping_category = default_shipping_category
  product.save!
end

Spree::Config[:currency] = "USD"
