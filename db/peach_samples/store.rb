Spree::Store.delete_all

customer_store = Spree::Store.create! name: 'customer-website', code: 'customer', default: true, 
                                      domains: 'customer.lvh.me:3000'
seller_store = Spree::Store.create! name: 'seller-website', code: 'seller', default: false,
                                    domains: 'seller.lvh.me:3000'
  
if Rails.env == "production"
  customer_store.domains = 'www.customer-peach.openjaf.com'
  seller_store.domains = 'www.seller-peach.openjaf.com' 
end

customer_store.save
seller_store.save

Spree::Product.all.each do |p|
  p.stores << [customer_store, seller_store]
  p.save
end
