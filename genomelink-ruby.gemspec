
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "genomelink/version"

Gem::Specification.new do |spec|
  spec.name          = "genomelink-ruby"
  spec.version       = Genomelink::VERSION
  spec.authors       = ["Ashwin Subramanian"]
  spec.email         = ["s.ashwinkumar24902gmail.com"]

  spec.summary       = %q{Ruby Gem to access genome link APIs}
  spec.description   = %q{This is a ruby gem to access the genome link APIs. It inclides the API classes and the OAuth system.}
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "byebug"
  spec.add_dependency "oauth2"
end
