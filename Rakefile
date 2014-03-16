require 'rake'
require 'rake/testtask'
require 'rake/packagetask'
require 'rubygems/package_task'
require 'rspec/core/rake_task'
require 'spree/testing_support/common_rake'

spec = eval(File.read('spree_peach_sample.gemspec'))

Gem::PackageTask.new(spec) do |p|
  p.gem_spec = spec
end

desc "Release to gemcutter"
task :release do
  version = File.read(File.expand_path("../SPREE_VERSION", __FILE__)).strip
  cmd = "cd pkg && gem push spree_peach_sample-#{version}.gem"; puts cmd; system cmd
end

desc "Generates a dummy app for testing"
task :test_app do
  ENV['LIB_NAME'] = 'spree/core'
  Rake::Task['common:test_app'].invoke
  Rake::Task['common:seed'].invoke
end

RSpec::Core::RakeTask.new
task :default => :spec
