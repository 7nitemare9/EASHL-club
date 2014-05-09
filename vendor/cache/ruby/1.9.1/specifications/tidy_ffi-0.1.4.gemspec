# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "tidy_ffi"
  s.version = "0.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Eugene Pimenov"]
  s.date = "2012-02-13"
  s.description = "Tidy library interface via FFI"
  s.email = "libc@libc.st"
  s.homepage = "http://github.com/libc/tidy_ffi"
  s.require_paths = ["lib"]
  s.rubyforge_project = "tidy-ffi"
  s.rubygems_version = "1.8.10"
  s.summary = "Tidy library interface via FFI"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ffi>, [">= 0.3.5"])
    else
      s.add_dependency(%q<ffi>, [">= 0.3.5"])
    end
  else
    s.add_dependency(%q<ffi>, [">= 0.3.5"])
  end
end
