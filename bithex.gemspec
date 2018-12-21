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

  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec)/}) }
  end
  spec.require_paths = ['lib']

  spec.add_dependency 'activerecord', '>= 4.2'

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'pg'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
end
