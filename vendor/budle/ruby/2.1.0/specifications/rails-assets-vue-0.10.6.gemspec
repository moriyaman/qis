# -*- encoding: utf-8 -*-
# stub: rails-assets-vue 0.10.6 ruby lib

Gem::Specification.new do |s|
  s.name = "rails-assets-vue"
  s.version = "0.10.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["rails-assets.org"]
  s.date = "2014-07-29"
  s.description = "Simple, Fast & Composable MVVM for building interative interfaces"
  s.homepage = "https://github.com/yyx990803/vue"
  s.rubygems_version = "2.2.2"
  s.summary = "Simple, Fast & Composable MVVM for building interative interfaces"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
