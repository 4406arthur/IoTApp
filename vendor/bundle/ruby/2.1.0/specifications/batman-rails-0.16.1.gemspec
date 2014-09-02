# -*- encoding: utf-8 -*-
# stub: batman-rails 0.16.1 ruby lib

Gem::Specification.new do |s|
  s.name = "batman-rails"
  s.version = "0.16.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Nick Small", "Matt Helm", "John Duff", "Kristian PD"]
  s.date = "2014-07-15"
  s.description = "Quickly get started with batman.js in a Rails app. Provides generators to get started and bundles in the latest version of batman.js."
  s.email = ["batmanjs@shopify.com"]
  s.homepage = "https://github.com/Shopify/batman-rails"
  s.rubygems_version = "2.2.2"
  s.summary = "Use batman.js with Rails"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>, [">= 3.2"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<rails>, [">= 0"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
    else
      s.add_dependency(%q<railties>, [">= 3.2"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<rails>, [">= 0"])
      s.add_dependency(%q<mocha>, [">= 0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
    end
  else
    s.add_dependency(%q<railties>, [">= 3.2"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<rails>, [">= 0"])
    s.add_dependency(%q<mocha>, [">= 0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
  end
end
