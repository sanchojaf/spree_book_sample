require 'ffaker'
require 'pathname'
require 'spree/regattable_sample'

namespace :spree_regattable_sample do
  desc 'Loads regattable sample data'
  task :load => :environment do
    if ARGV.include?("db:migrate")
      puts %Q{
Please run db:migrate separately from spree_regattable_sample:load.

Running db:migrate and spree_regattable_sample:load at the same time has been known to
cause problems where columns may be not available during regattable sample data loading.

Migrations have been run. Please run "rake spree_regattable_sample:load" by itself now.
      }
      exit(1)
    end

    SpreeRegattableSample::Engine.load_regattable_samples
  end
end


