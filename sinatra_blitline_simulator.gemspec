# coding: utf-8
#lib = File.expand_path('../lib', __FILE__)
#$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
#require 'sinatra_blitline_simulator/version'

Gem::Specification.new do |spec|
  spec.name          = 'sinatra_blitline_simulator'
  spec.version       = '0.0.1'
  spec.authors       = ['Michael Dawson']
  spec.email         = ['nippysaurus@me.com']
  spec.description   = 'Sinatra Blitline simulator'
  spec.summary       = 'A very crude simulator for the Blitline image processing service. Only simulates the response, does not actually do anything.'
  spec.homepage      = 'http://github.com/nippysaurus/sinatra_blitline_simulator'
  spec.license       = 'MIT'

  spec.files = [
      'README.md',
      'lib/sinatra_blitline_simulator.rb'
  ]

  spec.require_paths = ['lib']

  spec.add_dependency 'httparty', '~> 0.11'
  spec.add_dependency 'sinatra', '~> 1.3'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
