lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'skype_bot/version'

Gem::Specification.new do |spec|
  spec.name          = "skype_bot"
  spec.version       = SkypeBot::VERSION
  spec.authors       = ["Alexey Volodkin"]
  spec.email         = ["a@vldkn.com"]
  spec.description   = %q{Skype bot}
  spec.summary       = %q{Skype bot}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "skype"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
