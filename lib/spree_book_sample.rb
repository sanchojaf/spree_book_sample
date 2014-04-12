require 'spree_core'
require 'spree/book_sample'

module SpreeBookSample
  class Engine < Rails::Engine
    engine_name 'spree_book_sample'

    # Needs to be here so we can access it inside the tests
    def self.load_book_samples  
      Spree::BookSample.load_book_sample("payment_methods")
      Spree::BookSample.load_book_sample("shipping_categories")
      Spree::BookSample.load_book_sample("shipping_methods")
      Spree::BookSample.load_book_sample("tax_categories")
      Spree::BookSample.load_book_sample("tax_rates")

      Spree::BookSample.load_book_sample("products")
      Spree::BookSample.load_book_sample("taxons")
      Spree::BookSample.load_book_sample("option_values")
      Spree::BookSample.load_book_sample("product_option_types")
      Spree::BookSample.load_book_sample("product_properties")
      Spree::BookSample.load_book_sample("prototypes")
      Spree::BookSample.load_book_sample("variants")
      Spree::BookSample.load_book_sample("stock")
      Spree::BookSample.load_book_sample("assets")

      Spree::BookSample.load_book_sample("orders")
      Spree::BookSample.load_book_sample("adjustments")
      Spree::BookSample.load_book_sample("payments")
    end
  end
end
