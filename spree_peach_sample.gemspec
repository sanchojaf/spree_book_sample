# encoding: UTF-8
version = File.read(File.expand_path("../SPREE_VERSION", __FILE__)).strip

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_peach_sample'
  s.version     = version
  s.summary     = 'Peach sample data (including images) for use with Spree.'
  s.description = 'Required dependency for Spree'

  s.required_ruby_version = '>= 1.9.3'
  s.author      = 'Miguel Sancho'
  s.email       = 'sanchojaf@gmail.com'
  s.homepage    = 'https://github.com/sanchojaf/spree_peach_sample'
  s.license     = %q{BSD-3}

  s.files        = Dir['LICENSE', 'README.md', 'lib/**/*', 'db/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', version
end
