Spree::Store.delete_all

customer_store = Spree::Store.create! name: 'customer-website', code: 'customer', default: false, 
                                      domains: 'customer.lvh.me:3000'
stylist_store = Spree::Store.create! name: 'stylist-website', code: 'stylist', default: true,
                                    domains: 'stylist.lvh.me:3000'
  
if Rails.env == "staging" or Rails.env == "production"
  customer_store.domains = 'www.customer-peach.openjaf.com'
  stylist_store.domains = 'stage.peachunderneath.com'  
end

customer_store.save
stylist_store.save

Spree::Product.all.each do |p|
  p.stores << [customer_store, stylist_store]
  p.save
end
