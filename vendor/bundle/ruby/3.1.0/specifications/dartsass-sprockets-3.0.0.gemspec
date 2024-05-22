# -*- encoding: utf-8 -*-
# stub: dartsass-sprockets 3.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "dartsass-sprockets".freeze
  s.version = "3.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ryan Boland".freeze, "Johnny Shields".freeze]
  s.date = "2023-02-03"
  s.description = "Use Dart Sass with Sprockets and the Ruby on Rails asset pipeline.".freeze
  s.email = ["ryan@tanookilabs.com".freeze]
  s.homepage = "https://github.com/sass/dartsass-sprockets".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.6.0".freeze)
  s.rubygems_version = "3.3.7".freeze
  s.summary = "Use Dart Sass with Sprockets and the Ruby on Rails asset pipeline.".freeze

  s.installed_by_version = "3.3.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<pry>.freeze, [">= 0"])
    s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_development_dependency(%q<mocha>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<dartsass-ruby>.freeze, ["~> 3.0"])
    s.add_runtime_dependency(%q<tilt>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<railties>.freeze, [">= 4.0.0"])
    s.add_runtime_dependency(%q<sprockets>.freeze, ["> 3.0"])
    s.add_runtime_dependency(%q<sprockets-rails>.freeze, [">= 0"])
  else
    s.add_dependency(%q<pry>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<mocha>.freeze, [">= 0"])
    s.add_dependency(%q<dartsass-ruby>.freeze, ["~> 3.0"])
    s.add_dependency(%q<tilt>.freeze, [">= 0"])
    s.add_dependency(%q<railties>.freeze, [">= 4.0.0"])
    s.add_dependency(%q<sprockets>.freeze, ["> 3.0"])
    s.add_dependency(%q<sprockets-rails>.freeze, [">= 0"])
  end
end
