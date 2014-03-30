#Spree::Sample.load_sample("products")
#Spree::Sample.load_sample("variants")

products = {}
#products[:full] = Spree::Product.find_by_name!("Full") #Ruby on Rails Baseball Jersey
#products[:plunge] = Spree::Product.find_by_name!("Plunge") #Ruby on Rails Tote
products[:sleeveless_tee] = Spree::Product.find_by_name!("Sleeveless Tee") #Ruby on Rails Bag
products[:spaghetti_strap_cami] = Spree::Product.find_by_name!("Spaghetti Strap Cami") #Ruby on Rails Jr. Spaghetti
#products[:bikini] = Spree::Product.find_by_name!("Bikini") #Ruby on Rails Mug
products[:ribbed_knit_tank] = Spree::Product.find_by_name!("Ribbed-knit Tank") #Ruby on Rails Ringer T-Shirt
#products[:thong] = Spree::Product.find_by_name!("Thong") #Ruby on Rails Stein
products[:flyaway_jacket] = Spree::Product.find_by_name!("Flyaway Jacket") #Spree Baseball Jersey
#products[:girlshort] = Spree::Product.find_by_name!("Girlshort") #Spree Stein
products[:scoop_neck_cami] = Spree::Product.find_by_name!("Scoop Neck Cami") #Spree Jr. Spaghetti
#products[:brief] = Spree::Product.find_by_name!("Brief") #Spree Mug
products[:everyday_jacket] = Spree::Product.find_by_name!("Everyday Jacket") #Spree Ringer T-Shirt
products[:relaxed_legging] = Spree::Product.find_by_name!("Relaxed Legging") #Spree Tote
products[:everyday_pant] = Spree::Product.find_by_name!("Everyday Pant") #Spree Bag
products[:wrap_chemise] = Spree::Product.find_by_name!("Wrap Chemise") #Ruby Baseball Jersey
products[:wrap_cami] = Spree::Product.find_by_name!("Wrap Cami") #Apache Baseball Jersey

def image(name, type="jpg")
  dic_images = {
#    :plunge => "",
    :sleeveless_tee => "C-03Black",
	  :spaghetti_strap_cami => "C-01Black",
#	  :rib_knit_tank => "",
	  :flyaway_jacket =>  "J-02Pink",
#	  :bikini => "",
#	  :thong => "",
#	  :full => "",
#	  :girlshort => "",
#	  :brief => "",
	  :everyday_jacket => "J-01Black",
	  :relaxed_legging => "L-02Black",
	  :everyday_pant => "L-01Black",
	  :scoop_neck_cami => "C-02White",
	  :wrap_cami => "C-04Eggplant",
	  :wrap_chemise => "D-01Black",
	  :ribbed_knit_tank=> "T-01White", #T-01Pink,
#	  :v_neck_camisole => "MW-01Black",
#	  :strappy_camisole => "MW-02Black",
#	  :empire_tee	=> "MW-04Black",
#	  :3_4_sleeve_tee	=> "MW-03Black",
#	  :everyday_capri	=> "MW-08Black",
#	  :everyday_short	=> "MW-09Black",
#	  :wrap_jacket => "MW-06Black",
  }

  images_path = Pathname.new(File.dirname(__FILE__)) + "images"
  path = images_path + "#{dic_images[name]}.#{type}"
  return false if !File.exist?(path)
  File.open(path)
end

images = {
#  products[:plunge].master => [
#    {
#      :attachment => image("plunge")
#    },
#  ],
  products[:sleeveless_tee].master => [
    {
      :attachment => image("sleeveless_tee")
    }
  ],
#  products[:full].master => [ 
#    {
#      :attachment => image("full")
#    },
#  ],
  products[:spaghetti_strap_cami].master => [
    {
      :attachment => image("spaghetti_strap_cami")
    }
  ],
#  products[:bikini].master => [
#    {
#      :attachment => image("bikini")
#    },
#  ],
#  products[:ribbed_knit_tank].master => [
#    {
#      :attachment => image("ribbed_knit_tank")
#    },
#  ],
#  products[:thong].master => [
#    {
#      :attachment => image("thong")
#    },
#  ],
  products[:wrap_cami].master => [
    {
      :attachment => image("wrap_cami", "jpg")
    },
  ],
  products[:wrap_chemise].master => [
    {
      :attachment => image("wrap_chemise", "jpg")
    },
  ],
  products[:everyday_pant].master => [
    {
      :attachment => image("everyday_pant")
    },
  ],
  products[:relaxed_legging].master => [
    {
      :attachment => image("relaxed_legging")
    },
  ],
  products[:everyday_jacket].master => [
    {
      :attachment => image("everyday_jacket")
    },
  ],
  products[:scoop_neck_cami].master => [
    {
      :attachment => image("scoop_neck_cami")
    }
  ],
  products[:flyaway_jacket].master => [
    {
      :attachment => image("flyaway_jacket")
    },
  ],
#  products[:girlshort].master => [
#    {
#      :attachment => image("girlshort")
#    },
#  ],
#  products[:brief].master => [
#    {
#      :attachment => image("brief")
#    },
#  ],
}



#products[:full].variants.each do |variant|
#  color = variant.option_value("color").downcase
#  main_image = image("full_#{color}", "jpg")
#  variant.images.create!(:attachment => main_image)
#  back_image = image("full_#{color}", "jpg")
#  if back_image
#    variant.images.create!(:attachment => back_image)
#  end
#end

images.each do |variant, attachments|
  puts "Loading images for #{variant.product.name}"
  attachments.each do |attachment|
    variant.images.create!(attachment)
  end
end

