# -*- encoding: utf-8 -*-
# stub: sprig 0.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "sprig".freeze
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Lawson Kurtz".freeze, "Ryan Foster".freeze]
  s.date = "2015-11-16"
  s.description = "Sprig is a library for managing interconnected, environment-specific seed data.".freeze
  s.email = ["lawson.kurtz@viget.com".freeze, "ryan.foster@viget.com".freeze]
  s.homepage = "http://www.github.com/vigetlabs/sprig".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.12".freeze
  s.summary = "Relational, environment-specific seeding for Rails apps.".freeze

  s.installed_by_version = "2.6.12" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<appraisal>.freeze, [">= 1.0.3", "~> 1.0"])
      s.add_development_dependency(%q<rails>.freeze, ["~> 3.1"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 2.14.0"])
      s.add_development_dependency(%q<database_cleaner>.freeze, ["~> 1.2.0"])
      s.add_development_dependency(%q<webmock>.freeze, ["~> 1.15.0"])
      s.add_development_dependency(%q<vcr>.freeze, ["~> 2.8.0"])
      s.add_development_dependency(%q<test-unit>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<pry>.freeze, [">= 0"])
      s.add_development_dependency(%q<generator_spec>.freeze, [">= 0"])
      s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_development_dependency(%q<coveralls>.freeze, [">= 0"])
      s.add_development_dependency(%q<sqlite3>.freeze, [">= 0"])
    else
      s.add_dependency(%q<appraisal>.freeze, [">= 1.0.3", "~> 1.0"])
      s.add_dependency(%q<rails>.freeze, ["~> 3.1"])
      s.add_dependency(%q<rspec>.freeze, ["~> 2.14.0"])
      s.add_dependency(%q<database_cleaner>.freeze, ["~> 1.2.0"])
      s.add_dependency(%q<webmock>.freeze, ["~> 1.15.0"])
      s.add_dependency(%q<vcr>.freeze, ["~> 2.8.0"])
      s.add_dependency(%q<test-unit>.freeze, ["~> 3.0"])
      s.add_dependency(%q<pry>.freeze, [">= 0"])
      s.add_dependency(%q<generator_spec>.freeze, [">= 0"])
      s.add_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_dependency(%q<coveralls>.freeze, [">= 0"])
      s.add_dependency(%q<sqlite3>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<appraisal>.freeze, [">= 1.0.3", "~> 1.0"])
    s.add_dependency(%q<rails>.freeze, ["~> 3.1"])
    s.add_dependency(%q<rspec>.freeze, ["~> 2.14.0"])
    s.add_dependency(%q<database_cleaner>.freeze, ["~> 1.2.0"])
    s.add_dependency(%q<webmock>.freeze, ["~> 1.15.0"])
    s.add_dependency(%q<vcr>.freeze, ["~> 2.8.0"])
    s.add_dependency(%q<test-unit>.freeze, ["~> 3.0"])
    s.add_dependency(%q<pry>.freeze, [">= 0"])
    s.add_dependency(%q<generator_spec>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_dependency(%q<coveralls>.freeze, [">= 0"])
    s.add_dependency(%q<sqlite3>.freeze, [">= 0"])
  end
end
