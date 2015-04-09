# encoding: utf-8

$:.unshift File.expand_path('../lib', __FILE__)
require 'acts_as_localized/version'

Gem::Specification.new do |s|
  s.name          = "acts_as_localized"
  s.version       = ActsAsLocalized::VERSION
  s.authors       = ["Oleg Khabarov"]
  s.email         = ["oleg@khabarov.ca"]
  s.homepage      = "http://github.com/GBH/acts_as_localized"
  s.summary       = "Simple mechanism to deal with AR model attribute localization"
  s.description   = "A gem that adds simple mechanism to deal with localization of Active Record models"
  s.license       = 'MIT'

  s.files         = `git ls-files`.split("\n")
  s.platform      = Gem::Platform::RUBY
  s.require_paths = ['lib']

  s.required_ruby_version = '>= 1.9.3'

  s.add_dependency 'activerecord', '>= 3.0.0'
  s.add_dependency 'i18n'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'minitest'
end
