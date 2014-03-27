Spree::Sample.load_sample("taxonomies")
#Spree::Sample.load_sample("products")

categories = Spree::Taxonomy.find_by_name!("Categories")
#brands = Spree::Taxonomy.find_by_name!("Brand")

products = { 
   #TODO Deni
  :plunge => "Plunge", #Ruby on Rails Tote
  :sleeveless_tee => "Sleeveless Tee", #Ruby on Rails Bag
  :bikini => "Bikini", #Ruby on Rails Mug
  :thong => "Thong", #Ruby on Rails Stein
  :full => "Full", #  ror_baseball_jersey
  :spaghetti_strap_cami => "Spaghetti Strap Cami", #Ruby on Rails Jr. Spaghetti
  :ribbed_knit_tank => "Ribbed-knit Tank", #Ruby on Rails Ringer T-Shirt
  :girlshort => "Girlshort", #Spree Stein
  :brief => "Brief", #Spree Mug
  :everyday_jacket => "Everyday Jacket", #Spree Ringer T-Shirt
  :flyaway_jacket =>  "Flyaway Jacket", #Spree Baseball Jersey
  :relaxed_legging => "Relaxed Legging", #Spree Tote
  :everyday_pant => "Everyday Pant", #Spree Bag
  :scoop_neck_cami => "Scoop Neck Cami", #Spree Jr. Spaghetti
  :wrap_cami => "Wrap Cami", #Apache Baseball Jersey
  :wrap_chemise => "Wrap Chemise", #Ruby Baseball Jersey

}


products.each do |key, name|
  products[key] = Spree::Product.find_by_name!(name)
end

taxons = [
  {
    :name => "Categories",
    :taxonomy => categories,
    :position => 0
  },   
  {
    :name => "Bras",
    :taxonomy => categories,
    :parent => "Categories",
    :position => 1,
    :products => [
      products[:plunge],
      products[:full] 
      # TODO: add Demi
    ]
  },
  {
    :name => "Panties",
    :taxonomy => categories,
    :parent => "Categories",
    :position => 2,
    :products => [
      products[:bikini], 
      products[:thong], 
      products[:girlshort], 
      products[:brief]
    ]
  },
  {
    :name => "Camisoles",
    :taxonomy => categories,
    :parent => "Categories",
    :position => 3,
    :products => [
      products[:spaghetti_cami], 
      products[:scoop_neck_cami],
      products[:sleeveless_tee], 
      products[:wrap_cami], 
    ]
  },
  {
    :name => "Tanks",
    :taxonomy => categories,
    :parent => "Categories",
    :position => 4,
    :products => [
      products[:ribbed_knit_tank], 
    ]
  },
  {
    :name => "Dress",
    :taxonomy => categories,
    :parent => "Categories",
    :position => 5,
    :products => [
      products[:wrap_chemise],
    ]
  },
  {
    :name => "Jackets",
    :taxonomy => categories,
    :parent => "Categories",
    :position => 6,
    :products => [
      products[:flyaway_jacket], 
      products[:everyday_jacket], 
    ]
  },
  {
    :name => "Pants",
    :taxonomy => categories,
    :parent => "Categories",
    :position => 7,
    :products => [
      products[:relaxed_legging],
      products[:everyday_pant] 
    ]
  },
]


taxons.each do |taxon_attrs|
  puts "///////////////////// #{taxon_attrs.inspect}"
  if taxon_attrs[:parent]
    taxon_attrs[:parent] = Spree::Taxon.find_by_name!(taxon_attrs[:parent])
    Spree::Taxon.create!(taxon_attrs)
  end
end
