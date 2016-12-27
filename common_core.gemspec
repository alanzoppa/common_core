# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'common_core/version'

Gem::Specification.new do |spec|
  spec.name          = "common_core"
  spec.version       = CommonCore::VERSION
  spec.authors       = ["C. Alan Zoppa"]
  spec.email         = ["alan.zoppa@gmail.com"]

  spec.summary       = %q{Generates a lesson plan from standardized test results}
  spec.homepage      = "https://www.github.com/alanzoppa/common_core"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_runtime_dependency "insensitive_hash", "0.3.3"
end
