Spree::Sample.load_sample("taxonomies")
categories = Spree::Taxonomy.find_by_name!("Categories")

products = { 

  refined_spaghetti_strap_cami: 'Refined Spaghetti Strap Cami',
  refined_1_5_inch_scoop_neck_cami: 'Refined 1.5-inch Scoop Neck Cami',
  refined_1_5_inch_rib_knit_cami: 'Refined 1.5-inch Rib-knit Cami',
  refined_3_inch_scoop_neck_cami: 'Refined 3-inch Scoop Neck Cami',
  refined_wrap_cami: 'Refined Wrap Cami',
  refined_matchstick_pant: 'Refined Matchstick Pant',
  refined_straight_pant: 'Refined Straight Pant',
  refined_wrap_chemise: 'Refined Wrap Chemise',
  the_jennifer_wrap_jacket: 'The Jennifer Wrap Jacket',
  the_carolina_fitted_jacket: 'The Carolina Fitted Jacket', 
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
      products[:refined_spaghetti_strap_cami],
      products[:refined_1_5_inch_scoop_neck_cami],
      products[:refined_1_5_inch_rib_knit_cami],
      products[:refined_3_inch_scoop_neck_cami],
      products[:refined_wrap_cami],
    ]
  },
  {
    :name => "Bottoms",
    :taxonomy => categories,
    :parent => "Categories",
    :position => 2,
    :products => [
 
      products[:refined_matchstick_pant],
      products[:refined_straight_pant], 
    ]
  },
  {
    :name => "Chemises",
    :taxonomy => categories,
    :parent => "Categories",
    :position => 3,
    :products => [
      products[:refined_wrap_chemise],
    ]
  },
  {
    :name => "Jackets",
    :taxonomy => categories,
    :parent => "Categories",
    :position => 4,
    :products => [
      products[:the_jennifer_wrap_jacket], 
      products[:the_carolina_fitted_jacket], 
    ]
  },
]

taxons.each do |taxon_attrs|
  if taxon_attrs[:parent]
    taxon_attrs[:parent] = Spree::Taxon.find_by_name!(taxon_attrs[:parent])
    Spree::Taxon.create!(taxon_attrs)
  end
end
