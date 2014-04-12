require 'ffaker'
require 'pathname'
require 'spree/book_sample'

namespace :spree_book_sample do
  desc 'Loads book sample data'
  task :load => :environment do
    if ARGV.include?("db:migrate")
      puts %Q{
      Please run db:migrate separately from spree_book_sample:load.

      Running db:migrate and spree_book_sample:load at the same time has been known to
      cause problems where columns may be not available during book sample data loading.

      Migrations have been run. Please run "rake spree_book_sample:load" by itself now.
      }
      exit(1)
    end

    SpreeBookSample::Engine.load_book_samples
  end
end


