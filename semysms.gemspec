# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'semysms/version'

Gem::Specification.new do |spec|
  spec.name          = "semysms"
  spec.version       = Semysms::VERSION
  spec.authors       = ["Юрий Неб"]
  spec.email         = ["neb@region87.org"]

  spec.summary       = 'semysms'
  spec.description   = %q{gem semysms}
  spec.homepage      = "http://hotspot-online.ru"
  spec.license     = "MIT"
  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end
  spec.require_paths = ["lib"]
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_dependency "httparty"
end
