# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails-assets-vue/version'

Gem::Specification.new do |spec|
  spec.name          = "rails-assets-vue"
  spec.version       = RailsAssetsVue::VERSION
  spec.authors       = ["rails-assets.org"]
  spec.description   = "Simple, Fast & Composable MVVM for building interative interfaces"
  spec.summary       = "Simple, Fast & Composable MVVM for building interative interfaces"
  spec.homepage      = "https://github.com/yyx990803/vue"

  spec.files         = `find ./* -type f | cut -b 3-`.split($/)
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
