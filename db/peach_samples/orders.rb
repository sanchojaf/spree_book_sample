  :ror_tote => "Ruby on Rails Tote", #Plunge
  :ror_bag => "Ruby on Rails Bag", #Sleeveless Tee
  :ror_mug => "Ruby on Rails Mug", #Bikini
  :ror_stein => "Ruby on Rails Stein", #Thong
  :ror_baseball_jersey => "FC-16", #Full  
  :ror_jr_spaghetti => "Ruby on Rails Jr. Spaghetti", #Spaghetti Strap Cami
  :ror_ringer => "Ruby on Rails Ringer T-Shirt", #Ribbed-knit tank
  :spree_stein => "Spree Stein", #Girlshort
  :spree_mug => "Spree Mug", #Brief
  :spree_ringer => "Spree Ringer T-Shirt", #Everyday jacket
  :spree_baseball_jersey =>  "Spree Baseball Jersey", #Flyaway jacket
  :spree_tote => "Spree Tote", #Relaxed legging
  :spree_bag => "Spree Bag", #Everyday pant
  :spree_jr_spaghetti => "Spree Jr. Spaghetti", #Scoop Neck Cami
  :apache_baseball_jersey => "Apache Baseball Jersey", #Wrap Cami
  :ruby_baseball_jersey => "Ruby Baseball Jersey", #Wrap chemise


Spree::Sample.load_sample("addresses")

orders = []
orders << Spree::Order.create!(
  :number => "R123456789",
  :email => "spree@example.com",
  :item_total => 150.95,
  :adjustment_total => 150.95,
  :total => 301.90,
  :shipping_address => Spree::Address.first,
  :billing_address => Spree::Address.last)

orders << Spree::Order.create!(
  :number => "R987654321",
  :email => "spree@example.com",
  :item_total => 15.95,
  :adjustment_total => 15.95,
  :total => 31.90,
  :shipping_address => Spree::Address.first,
  :billing_address => Spree::Address.last)

orders[0].line_items.create!(
  :variant => Spree::Product.find_by_name!("Plunge").master, #Ruby on Rails Tote
  :quantity => 1,
  :price => 15.99)

orders[1].line_items.create!(
  :variant => Spree::Product.find_by_name!("Sleeveless Tee").master, #Ruby on Rails Bag
  :quantity => 1,
  :price => 22.99)

orders.each(&:create_proposed_shipments)

orders.each do |order|
  order.state = "complete"
  order.completed_at = Time.now - 1.day
  order.save!
end
