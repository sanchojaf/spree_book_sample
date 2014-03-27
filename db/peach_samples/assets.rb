#Spree::Sample.load_sample("products")
#Spree::Sample.load_sample("variants")

products = {}
products[:ror_baseball_jersey] = Spree::Product.find_by_name!("Ruby on Rails Baseball Jersey") #Full
products[:ror_tote] = Spree::Product.find_by_name!("Ruby on Rails Tote") #Plunge
products[:ror_bag] = Spree::Product.find_by_name!("Ruby on Rails Bag") #Sleeveless Tee
products[:ror_jr_spaghetti] = Spree::Product.find_by_name!("Ruby on Rails Jr. Spaghetti") #Spaghetti Strap Cami
products[:ror_mug] = Spree::Product.find_by_name!("Ruby on Rails Mug") #Bikini
products[:ror_ringer] = Spree::Product.find_by_name!("Ruby on Rails Ringer T-Shirt") #Ribbed-knit tank
products[:ror_stein] = Spree::Product.find_by_name!("Ruby on Rails Stein") #Thong
products[:spree_baseball_jersey] = Spree::Product.find_by_name!("Spree Baseball Jersey") #Flyaway jacket
products[:spree_stein] = Spree::Product.find_by_name!("Spree Stein") #Girlshort
products[:spree_jr_spaghetti] = Spree::Product.find_by_name!("Spree Jr. Spaghetti") #Scoop Neck Cami
products[:spree_mug] = Spree::Product.find_by_name!("Spree Mug") #Brief
products[:spree_ringer] = Spree::Product.find_by_name!("Spree Ringer T-Shirt") #Everyday jacket
products[:spree_tote] = Spree::Product.find_by_name!("Spree Tote") #Relaxed legging
products[:spree_bag] = Spree::Product.find_by_name!("Spree Bag") #Everyday pant
products[:ruby_baseball_jersey] = Spree::Product.find_by_name!("Ruby Baseball Jersey") #Wrap chemise
products[:apache_baseball_jersey] = Spree::Product.find_by_name!("Apache Baseball Jersey") #Wrap Cami


def image(name, type="jpg")
  images_path = Pathname.new(File.dirname(__FILE__)) + "images"
  path = images_path + "#{name}.#{type}"
  return false if !File.exist?(path)
  File.open(path)
end

images = {
  products[:ror_tote].master => [
    {
      :attachment => image("ror_tote")
    },
    {
      :attachment => image("ror_tote_back") 
    }
  ],
  products[:ror_bag].master => [
    {
      :attachment => image("ror_bag")
    }
  ],
  products[:ror_baseball_jersey].master => [
    {
      :attachment => image("ror_baseball")
    },
    {
      :attachment => image("ror_baseball_back")
    }
  ],
  products[:ror_jr_spaghetti].master => [
    {
      :attachment => image("ror_jr_spaghetti")
    }
  ],
  products[:ror_mug].master => [
    {
      :attachment => image("ror_mug")
    },
    {
      :attachment => image("ror_mug_back")
    }
  ],
  products[:ror_ringer].master => [
    {
      :attachment => image("ror_ringer")
    },
    {
      :attachment => image("ror_ringer_back")
    }
  ],
  products[:ror_stein].master => [
    {
      :attachment => image("ror_stein")
    },
    {
      :attachment => image("ror_stein_back")
    }
  ],
  products[:apache_baseball_jersey].master => [
    {
      :attachment => image("apache_baseball", "jpg")
    },
  ],
  products[:ruby_baseball_jersey].master => [
    {
      :attachment => image("ruby_baseball", "jpg")
    },
  ],
  products[:spree_bag].master => [
    {
      :attachment => image("spree_bag")
    },
  ],
  products[:spree_tote].master => [
    {
      :attachment => image("spree_tote_front")
    },
    {
      :attachment => image("spree_tote_back") 
    }
  ],
  products[:spree_ringer].master => [
    {
      :attachment => image("spree_ringer_t")
    },
    {
      :attachment => image("spree_ringer_t_back") 
    }
  ],
  products[:spree_jr_spaghetti].master => [
    {
      :attachment => image("spree_spaghetti")
    }
  ],
  products[:spree_baseball_jersey].master => [
    {
      :attachment => image("spree_jersey")
    },
    {
      :attachment => image("spree_jersey_back") 
    }
  ],
  products[:spree_stein].master => [
    {
      :attachment => image("spree_stein")
    },
    {
      :attachment => image("spree_stein_back") 
    }
  ],
  products[:spree_mug].master => [
    {
      :attachment => image("spree_mug")
    },
    {
      :attachment => image("spree_mug_back") 
    }
  ],
}

products[:ror_baseball_jersey].variants.each do |variant|
  color = variant.option_value("tshirt-color").downcase
  main_image = image("ror_baseball_jersey_#{color}", "jpg")
  variant.images.create!(:attachment => main_image)
  back_image = image("ror_baseball_jersey_back_#{color}", "jpg")
  if back_image
    variant.images.create!(:attachment => back_image)
  end
end

images.each do |variant, attachments|
  puts "Loading images for #{variant.product.name}"
  attachments.each do |attachment|
    variant.images.create!(attachment)
  end
end

