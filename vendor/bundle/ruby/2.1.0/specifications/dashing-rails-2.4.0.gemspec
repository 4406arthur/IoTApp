# -*- encoding: utf-8 -*-
# stub: dashing-rails 2.4.0 ruby lib

Gem::Specification.new do |s|
  s.name = "dashing-rails"
  s.version = "2.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Pierre-Louis Gottfrois"]
  s.date = "2014-08-24"
  s.description = "The exceptionally handsome dashboard framework for Rails."
  s.email = ["pierrelouis.gottfrois@gmail.com"]
  s.homepage = "https://github.com/gottfrois/dashing-rails"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.2"
  s.summary = "The exceptionally handsome dashboard framework for Rails."

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, ["~> 4.1"])
      s.add_runtime_dependency(%q<jquery-rails>, ["~> 3.1"])
      s.add_runtime_dependency(%q<coffee-script>, ["~> 2.2"])
      s.add_runtime_dependency(%q<batman-rails>, ["~> 0.16.1"])
      s.add_runtime_dependency(%q<rufus-scheduler>, ["~> 3.0"])
      s.add_runtime_dependency(%q<redis>, ["~> 3.1"])
      s.add_runtime_dependency(%q<connection_pool>, ["~> 2.0"])
      s.add_development_dependency(%q<rspec-rails>, ["~> 2.14"])
      s.add_development_dependency(%q<pry-rails>, ["~> 0.3"])
      s.add_development_dependency(%q<better_errors>, ["~> 1.0"])
    else
      s.add_dependency(%q<rails>, ["~> 4.1"])
      s.add_dependency(%q<jquery-rails>, ["~> 3.1"])
      s.add_dependency(%q<coffee-script>, ["~> 2.2"])
      s.add_dependency(%q<batman-rails>, ["~> 0.16.1"])
      s.add_dependency(%q<rufus-scheduler>, ["~> 3.0"])
      s.add_dependency(%q<redis>, ["~> 3.1"])
      s.add_dependency(%q<connection_pool>, ["~> 2.0"])
      s.add_dependency(%q<rspec-rails>, ["~> 2.14"])
      s.add_dependency(%q<pry-rails>, ["~> 0.3"])
      s.add_dependency(%q<better_errors>, ["~> 1.0"])
    end
  else
    s.add_dependency(%q<rails>, ["~> 4.1"])
    s.add_dependency(%q<jquery-rails>, ["~> 3.1"])
    s.add_dependency(%q<coffee-script>, ["~> 2.2"])
    s.add_dependency(%q<batman-rails>, ["~> 0.16.1"])
    s.add_dependency(%q<rufus-scheduler>, ["~> 3.0"])
    s.add_dependency(%q<redis>, ["~> 3.1"])
    s.add_dependency(%q<connection_pool>, ["~> 2.0"])
    s.add_dependency(%q<rspec-rails>, ["~> 2.14"])
    s.add_dependency(%q<pry-rails>, ["~> 0.3"])
    s.add_dependency(%q<better_errors>, ["~> 1.0"])
  end
end
