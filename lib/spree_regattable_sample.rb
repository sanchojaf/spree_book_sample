require 'spree_core'
require 'spree/regattable_sample'

module SpreeRegattableSample
  class Engine < Rails::Engine
    engine_name 'spree_regattable_sample'

    # Needs to be here so we can access it inside the tests
    def self.load_regattable_samples
      Spree::RegattableSample.load_regattable_sample("payment_methods")
      Spree::RegattableSample.load_regattable_sample("shipping_categories")
      Spree::RegattableSample.load_regattable_sample("shipping_methods")
      Spree::RegattableSample.load_regattable_sample("tax_categories")
      Spree::RegattableSample.load_regattable_sample("tax_rates")

      Spree::RegattableSample.load_regattable_sample("products")
      Spree::RegattableSample.load_regattable_sample("taxons")
      Spree::RegattableSample.load_regattable_sample("option_values")
      Spree::RegattableSample.load_regattable_sample("product_option_types")
      Spree::RegattableSample.load_regattable_sample("product_properties")
      Spree::RegattableSample.load_regattable_sample("prototypes")
      Spree::RegattableSample.load_regattable_sample("variants")
      Spree::RegattableSample.load_regattable_sample("stock")
      Spree::RegattableSample.load_regattable_sample("assets")

      Spree::RegattableSample.load_regattable_sample("orders")
      Spree::RegattableSample.load_regattable_sample("adjustments")
      Spree::RegattableSample.load_regattable_sample("payments")
    end
  end
end
