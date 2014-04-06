#Spree::Sample.load_sample("option_values")
#Spree::Sample.load_sample("products")


refined_spaghetti_strap_cami  = Spree::Product.find_by_name!("Refined Spaghetti Strap Cami") 
refined_1_5_inch_scoop_neck_cami  = Spree::Product.find_by_name!("Refined 1.5-inch Scoop Neck Cami")
refined_1_5_inch_rib_knit_cami  = Spree::Product.find_by_name!("Refined 1.5-inch Rib-knit Cami") 
refined_3_inch_scoop_neck_cami  = Spree::Product.find_by_name!("Refined 3-inch Scoop Neck Cami") 
refined_wrap_cami  = Spree::Product.find_by_name!("Refined Wrap Cami")
refined_matchstick_pant  = Spree::Product.find_by_name!("Refined Matchstick Pant")
refined_straight_pant  = Spree::Product.find_by_name!("Refined Straight Pant")
refined_wrap_chemise  = Spree::Product.find_by_name!("Refined Wrap Chemise")
the_jennifer_wrap_jacket  = Spree::Product.find_by_name!("The Jennifer Wrap Jacket") 
the_carolina_fitted_jacket  = Spree::Product.find_by_name!("The Carolina Fitted Jacket") 

xs = Spree::OptionValue.find_by_name!("XS")
s = Spree::OptionValue.find_by_name!("S")
m = Spree::OptionValue.find_by_name!("M")
l = Spree::OptionValue.find_by_name!("L")
xl = Spree::OptionValue.find_by_name!("XL")
xxl = Spree::OptionValue.find_by_name!("XXL")

black = Spree::OptionValue.find_by_name!("Black")
natural = Spree::OptionValue.find_by_name!("Natural")
white = Spree::OptionValue.find_by_name!("White")
cream = Spree::OptionValue.find_by_name!("Cream")
gray = Spree::OptionValue.find_by_name!("Gray")
heather_grey = Spree::OptionValue.find_by_name!("Heather Grey")
blossom = Spree::OptionValue.find_by_name!("Blossom")
eggplant = Spree::OptionValue.find_by_name!("Eggplant")
lilac = Spree::OptionValue.find_by_name!("Lilac")

sizes = [xs, s, m, l, xl, xxl]

products = {

  refined_spaghetti_strap_cami => [black, white, gray, natural, cream, blossom, lilac, eggplant],
  refined_1_5_inch_scoop_neck_cami =>  [black, white, gray, natural, cream, blossom, lilac, eggplant],
  refined_1_5_inch_rib_knit_cami => [black, white, heather_grey, natural, cream, blossom, lilac, eggplant],
  refined_3_inch_scoop_neck_cami =>  [black, white, gray, natural, cream, blossom, lilac, eggplant],
  refined_wrap_cami => [black, white, gray, blossom, lilac, eggplant],
  refined_matchstick_pant => [black, gray],
  refined_straight_pant => [black, gray],
  refined_wrap_chemise => [black, gray, blossom, eggplant],
  the_jennifer_wrap_jacket => [black, gray],
  the_carolina_fitted_jacket =>  [black, blossom],
}

variants = []
masters = {}

products.each do |product, colors|
  colors.each do |color|
    sizes.each do |size|

      variants << {
          :product => product, 
          :option_values => [size, color],
          :sku => "#{product.sku}_#{size}_#{color}",
          :cost_price => product.price
        }

      masters[product] = { 
          :sku => "#{product.sku}",
          :cost_price => product.price
        }
    end
  end
end

Spree::Variant.create!(variants)

masters.each do |product, variant_attrs|
  product.master.update_attributes!(variant_attrs)
end
