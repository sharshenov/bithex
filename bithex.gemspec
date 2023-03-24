# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bithex/version'

Gem::Specification.new do |spec|
  spec.name          = 'bithex'
  spec.version       = Bithex::VERSION
  spec.authors       = ['Rustam Sharshenov']
  spec.email         = ['rustam@sharshenov.com']

  spec.summary       = 'Store hex strings as bit strings'
  spec.description   = 'Store hex strings as bit strings in PostgreSQL'
  spec.homepage      = 'https://github.com/sharshenov/bithex'
  spec.license       = 'MIT'

  if spec.respond_to?(:metadata)
    spec.metadata['homepage_uri'] = spec.homepage
    spec.metadata['source_code_uri'] = spec.homepage
    spec.metadata['changelog_uri'] = "#{spec.homepage}/blob/master/CHANGELOG.md"
  end

  spec.files = Dir['CHANGELOG.md', 'LICENSE.txt', 'README.md', 'lib/**/*']

  spec.require_paths = ['lib']

  spec.add_dependency 'activerecord', '>= 6.0', '< 7.0'

  spec.add_development_dependency 'pg'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'appraisal'
  spec.add_development_dependency 'wwtd'
end
