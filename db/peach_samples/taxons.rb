Spree::Sample.load_sample("taxonomies")
categories = Spree::Taxonomy.find_by_name!("Categories")

products = { 
  :plunge => "Plunge", 
  :sleeveless_tee => "Sleeveless Tee",
  :bikini => "Bikini", 
  :thong => "Thong", 
  :full => "Full", 
  :spaghetti_strap_cami => "Spaghetti Strap Cami", 
  :ribbed_knit_tank => "Ribbed-knit Tank", 
  :girlshort => "Girlshort", 
  :brief => "Brief", 
  :everyday_jacket => "Everyday Jacket", 
  :flyaway_jacket =>  "Flyaway Jacket", 
  :relaxed_legging => "Relaxed Legging", 
  :everyday_pant => "Everyday Pant", 
  :scoop_neck_cami => "Scoop Neck Cami", 
  :wrap_cami => "Wrap Cami", 
  :wrap_chemise => "Wrap Chemise", 
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
    :name => "Tops",
    :taxonomy => categories,
    :parent => "Categories",
    :position => 1,
    :products => [
      products[:spaghetti_strap_cami], 
      products[:scoop_neck_cami],
      products[:ribbed_knit_tank], 
      products[:sleeveless_tee], 
      products[:wrap_cami], 
    ]
  },
  {
    :name => "Bottoms",
    :taxonomy => categories,
    :parent => "Categories",
    :position => 2,
    :products => [
      products[:relaxed_legging],
      products[:everyday_pant] 
    ]
  },
  {
    :name => "Chemises",
    :taxonomy => categories,
    :parent => "Categories",
    :position => 3,
    :products => [
      products[:wrap_chemise],
    ]
  },
  {
    :name => "Jackets",
    :taxonomy => categories,
    :parent => "Categories",
    :position => 4,
    :products => [
      products[:flyaway_jacket], 
      products[:everyday_jacket], 
    ]
  },
]

taxons.each do |taxon_attrs|
  if taxon_attrs[:parent]
    taxon_attrs[:parent] = Spree::Taxon.find_by_name!(taxon_attrs[:parent])
    Spree::Taxon.create!(taxon_attrs)
  end
end
