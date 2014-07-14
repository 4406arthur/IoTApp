# -*- encoding: utf-8 -*-
# stub: rails-gallery 0.3.3 ruby lib

Gem::Specification.new do |s|
  s.name = "rails-gallery"
  s.version = "0.3.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Kristian Mandrup"]
  s.date = "2012-10-11"
  s.description = "Add photo galleries to your Rails apps :)"
  s.email = "kmandrup@gmail.com"
  s.homepage = "https://github.com/kristianmandrup/rails-gallery"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.2"
  s.summary = "Gallery functionality for Rails apps"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 3.1"])
      s.add_runtime_dependency(%q<hashie>, [">= 2.0.0"])
    else
      s.add_dependency(%q<rails>, [">= 3.1"])
      s.add_dependency(%q<hashie>, [">= 2.0.0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 3.1"])
    s.add_dependency(%q<hashie>, [">= 2.0.0"])
  end
end
