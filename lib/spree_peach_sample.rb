require 'spree_core'
require 'spree/peach_sample'

module SpreePeachSample
  class Engine < Rails::Engine
    engine_name 'spree_peach_sample'

    # Needs to be here so we can access it inside the tests
    def self.load_peach_samples
      Spree::PeachSample.load_peach_sample("payment_methods")
      Spree::PeachSample.load_peach_sample("shipping_categories")
      Spree::PeachSample.load_peach_sample("shipping_methods")
      Spree::PeachSample.load_peach_sample("tax_categories")
      Spree::PeachSample.load_peach_sample("tax_rates")

      Spree::PeachSample.load_peach_sample("products")
      Spree::PeachSample.load_peach_sample("taxons")
      Spree::PeachSample.load_peach_sample("option_values")
      Spree::PeachSample.load_peach_sample("product_option_types")
      Spree::PeachSample.load_peach_sample("product_properties")
      Spree::PeachSample.load_peach_sample("prototypes")
      Spree::PeachSample.load_peach_sample("variants")
      Spree::PeachSample.load_peach_sample("stock")
      #Spree::PeachSample.load_peach_sample("assets")

      Spree::PeachSample.load_peach_sample("orders")
      Spree::PeachSample.load_peach_sample("adjustments")
      Spree::PeachSample.load_peach_sample("payments")
      Spree::PeachSample.load_peach_sample("store")
    end
  end
end
