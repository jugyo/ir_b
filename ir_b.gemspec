# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.authors       = ["jugyo"]
  gem.email         = ["jugyo.org@gmail.com"]
  gem.description   = %q{You can do irb anywhere by calling 'ir b' (need a whitespace!).}
  gem.summary       = %q{irb anywhere}
  gem.homepage      = "https://github.com/jugyo/ir_b"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "ir_b"
  gem.require_paths = ["lib"]
  gem.version       = '1.4.0'

  gem.add_development_dependency "shoulda", ">= 0"
  gem.add_development_dependency "rr", ">= 0"
end
