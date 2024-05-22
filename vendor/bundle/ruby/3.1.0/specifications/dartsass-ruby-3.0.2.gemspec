# -*- encoding: utf-8 -*-
# stub: dartsass-ruby 3.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "dartsass-ruby".freeze
  s.version = "3.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "documentation_uri" => "https://rubydoc.info/gems/dartsass-ruby/3.0.2", "source_code_uri" => "https://github.com/tablecheck/dartsass-ruby/tree/v3.0.2" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ryan Boland".freeze, "\u306A\u3064\u304D".freeze, "Johnny Shields".freeze]
  s.date = "2023-10-25"
  s.description = "Use Dart Sass with Ruby".freeze
  s.email = ["ryan@tanookilabs.com".freeze, "i@ntk.me".freeze]
  s.homepage = "https://github.com/tablecheck/dartsass-ruby".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.6.0".freeze)
  s.rubygems_version = "3.3.7".freeze
  s.summary = "Use Dart Sass with Ruby".freeze

  s.installed_by_version = "3.3.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<sass-embedded>.freeze, ["~> 1.54", "< 1.67"])
    s.add_development_dependency(%q<minitest>.freeze, ["~> 5.16.0"])
    s.add_development_dependency(%q<minitest-around>.freeze, ["~> 0.5.0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 10.0.0"])
    s.add_development_dependency(%q<rubocop>.freeze, ["~> 1.37.0"])
    s.add_development_dependency(%q<rubocop-minitest>.freeze, ["~> 0.22.0"])
    s.add_development_dependency(%q<rubocop-performance>.freeze, ["~> 1.15.0"])
    s.add_development_dependency(%q<rubocop-rake>.freeze, ["~> 0.6.0"])
  else
    s.add_dependency(%q<sass-embedded>.freeze, ["~> 1.54", "< 1.67"])
    s.add_dependency(%q<minitest>.freeze, ["~> 5.16.0"])
    s.add_dependency(%q<minitest-around>.freeze, ["~> 0.5.0"])
    s.add_dependency(%q<rake>.freeze, [">= 10.0.0"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 1.37.0"])
    s.add_dependency(%q<rubocop-minitest>.freeze, ["~> 0.22.0"])
    s.add_dependency(%q<rubocop-performance>.freeze, ["~> 1.15.0"])
    s.add_dependency(%q<rubocop-rake>.freeze, ["~> 0.6.0"])
  end
end
