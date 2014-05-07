# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "scrapi"
  s.version = "2.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Assaf Arkin"]
  s.autorequire = "scrapi.rb"
  s.date = "2010-11-10"
  s.description = "scrAPI is an HTML scraping toolkit for Ruby. It uses CSS selectors to write easy, maintainable scraping rules to select, extract and store data from HTML content.\n"
  s.email = "assaf@labnotes.org"
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["README.rdoc"]
  s.homepage = "http://github.com/assaf/scrapi"
  s.rdoc_options = ["--main", "README.rdoc", "--title", "scrAPI toolkit for Ruby", "--line-numbers"]
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.1")
  s.requirements = ["Tidy_ffi"]
  s.rubyforge_project = "scrapi"
  s.rubygems_version = "1.8.25"
  s.summary = "scrAPI toolkit for Ruby. Uses CSS selectors to write easy, maintainable HTML scraping rules."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<tidy_ffi>, [">= 0.1.2"])
    else
      s.add_dependency(%q<tidy_ffi>, [">= 0.1.2"])
    end
  else
    s.add_dependency(%q<tidy_ffi>, [">= 0.1.2"])
  end
end
