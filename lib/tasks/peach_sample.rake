require 'ffaker'
require 'pathname'
require 'spree/peach_sample'

namespace :spree_peach_sample do
  desc 'Loads peach sample data'
  task :load => :environment do
    if ARGV.include?("db:migrate")
      puts %Q{
Please run db:migrate separately from spree_peach_sample:load.

Running db:migrate and spree_peach_sample:load at the same time has been known to
cause problems where columns may be not available during peach sample data loading.

Migrations have been run. Please run "rake spree_peach_sample:load" by itself now.
      }
      exit(1)
    end

    SpreePeachSample::Engine.load_peach_samples
  end
end


