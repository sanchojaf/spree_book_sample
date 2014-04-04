#Spree::Sample.load_sample("products")
#Spree::Sample.load_sample("variants")

products = {}

products[:refined_spaghetti_strap_cami] = Spree::Product.find_by_name!("Refined Spaghetti Strap Cami") 
products[:refined_1_5_inch_scoop_neck_cami] = Spree::Product.find_by_name!("Refined 1.5-inch Scoop Neck Cami")
products[:refined_1_5_inch_rib_knit_cami] = Spree::Product.find_by_name!("Refined 1.5-inch Rib-knit Cami") 
products[:refined_3_inch_scoop_neck_cami] = Spree::Product.find_by_name!("Refined 3-inch Scoop Neck Cami") 
products[:refined_wrap_cami] = Spree::Product.find_by_name!("Refined Wrap Cami")
products[:refined_matchstick_pant] = Spree::Product.find_by_name!("Refined Straight Pant")
products[:refined_straight_pant] = Spree::Product.find_by_name!("Refined Straight Pant")
products[:refined_wrap_chemise] = Spree::Product.find_by_name!("Refined Wrap Chemise")
products[:the_jennifer_wrap_jacket] = Spree::Product.find_by_name!("The Jennifer Wrap Jacket") 
products[:the_carolina_fitted_jacket] = Spree::Product.find_by_name!("The Jennifer Wrap Jacket") 

def image(name, type="jpg")
  dic_images = {

      :refined_spaghetti_strap_cami => 'C-01Black',
      :refined_1_5_inch_scoop_neck_cami =>  'C-02White',
      :refined_1_5_inch_rib_knit_cami => 'T-01White',
      :refined_3_inch_scoop_neck_cami => 'C-03Black',
      :refined_wrap_cami => 'L-02Black',
      :refined_matchstick_pant => 'C-04Eggplant',
      :refined_straight_pant => 'L-01Black',
      :refined_wrap_chemise => 'D-01Black',
      :the_jennifer_wrap_jacket => 'J-02Pink',
      :the_carolina_fitted_jacket => 'J-01Black'

  }

  images_path = Pathname.new(File.dirname(__FILE__)) + "images"
  path = images_path + "#{dic_images[name]}.#{type}"
  return false if !File.exist?(path)
  File.open(path)
end

images = {}

products.each do |k, p|
 images[p.master] = image(k) 
end

puts "images #{image.inspect}"

images.each do |variant, attachments|
  puts "Loading images for #{variant.product.name}"
  attachments.each do |attachment|
    variant.images.create!(attachment)
  end
end

