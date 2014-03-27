#Spree::Sample.load_sample("option_values")
#Spree::Sample.load_sample("products")

full = Spree::Product.find_by_name!("Full") # Ruby on Rails Baseball Jersey
plunge = Spree::Product.find_by_name!("Plunge") #Ruby on Rails Tote
sleeveless_tee = Spree::Product.find_by_name!("Sleeveless Tee") #Ruby on Rails Bag
spaghetti_strap_cami = Spree::Product.find_by_name!("Spaghetti Strap Cami") #Ruby on Rails Jr. Spaghetti
bikini = Spree::Product.find_by_name!("Bikini") #Ruby on Rails Mug
ribbed_knit_tank = Spree::Product.find_by_name!("Ribbed-knit Tank") # Ruby on Rails Ringer T-Shirt
thong = Spree::Product.find_by_name!("Thong") #Ruby on Rails Stein
flyaway_jacket = Spree::Product.find_by_name!("Flyaway Jacket") #Spree Baseball Jersey
girlshort = Spree::Product.find_by_name!("Girlshort") #Spree Stein
scoop_neck_cami = Spree::Product.find_by_name!("Scoop Neck Cami") #Spree Jr. Spaghetti
brief = Spree::Product.find_by_name!("Brief") #Spree Mug
everyday_jacket = Spree::Product.find_by_name!("Everyday Jacket") #Spree Ringer T-Shirt
relaxed_legging = Spree::Product.find_by_name!("Relaxed Legging") #Spree Tote
everyday_pant = Spree::Product.find_by_name!("Everyday Pant") #Spree Bag
wrap_chemise = Spree::Product.find_by_name!("Wrap Chemise") #Ruby Baseball Jersey
wrap_cami = Spree::Product.find_by_name!("Wrap Cami") #Apache Baseball Jersey


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
heater_grey = Spree::OptionValue.find_by_name!("Heater Grey")
blossom = Spree::OptionValue.find_by_name!("Blossom")
eggplant = Spree::OptionValue.find_by_name!("Eggplant")
lilac = Spree::OptionValue.find_by_name!("Lilac")

sizes = [xs, s, m, l, xl, xxl]

products = {
  full                  => [black, natural],
  plunge                => [black, natural], 
  sleeveless_tee        => [black, white, gray, natural, cream, blossom, lilac, eggplant], 
  spaghetti_strap_cami  => [black, white, gray, natural, cream, blossom, lilac, eggplant],
  bikini                => [black, natural, blossom, lilac, eggplant],
  ribbed_knit_tank      => [black, white, heater_grey, natural, cream, blossom, lilac, eggplant], 
  thong                 => [black, natural, blossom, lilac, eggplant], 
  flyaway_jacket        => [black, gray],
  girlshort             => [black, natural, blossom, lilac, eggplant],
  scoop_neck_cami       => [black, white, gray, natural, cream, blossom, lilac, eggplant],
  brief                 => [black, natural, blossom, lilac, eggplant],
  everyday_jacket       => [black, blossom],
  relaxed_legging       => [black, gray],
  everyday_pant         => [black, gray],
  wrap_chemise          => [black, gray, blossom, eggplant],
  wrap_cami             => [black, white, gray, blossom, lilac, eggplant]
}

varians = []
masters = {}

products.each do |product, colors|
  colors.each do |color|
    sizes.each do |size|

      variants << {
          :product => product, 
          :option_values => [size, color],
          :sku => "#{product.name.gsub(' ','_')}-#{size.position}-#{color.position}",
          :cost_price => 10 + rand(90)
        }

      masters << {
         product => { 
          :sku => "#{product.name.gsub(' ','_')}",
          :cost_price => 10 + rand(90)
        }
      }
    end
  end
end

Spree::Variant.create!(variants)

masters.each do |product, variant_attrs|
  product.master.update_attributes!(variant_attrs)
end
