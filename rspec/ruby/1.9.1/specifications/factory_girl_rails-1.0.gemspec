# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "factory_girl_rails"
  s.version = "1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Joe Ferris"]
  s.date = "2010-06-11"
  s.description = "factory_girl_rails provides integration between\n    factory_girl and rails 3 (currently just automatic factory definition\n    loading)"
  s.email = "jferris@thoughtbot.com"
  s.homepage = "http://thoughtbot.com/projects/factory_girl_rails"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.12"
  s.summary = "factory_girl_rails provides integration between factory_girl and rails 3"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 3.0.0.beta4"])
      s.add_runtime_dependency(%q<factory_girl>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<cucumber>, [">= 0"])
    else
      s.add_dependency(%q<rails>, [">= 3.0.0.beta4"])
      s.add_dependency(%q<factory_girl>, ["~> 1.3"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<cucumber>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 3.0.0.beta4"])
    s.add_dependency(%q<factory_girl>, ["~> 1.3"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<cucumber>, [">= 0"])
  end
end
