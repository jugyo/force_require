# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.authors       = ["jugyo"]
  gem.email         = ["jugyo.org@gmail.com"]
  gem.description   = %q{Force require for Bundler environment! Yeaaaaaaaaaaah!}
  gem.summary       = %q{You can require any gems on Bundler!}
  gem.homepage      = "https://github.com/jugyo/force_require"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "force_require"
  gem.require_paths = ["lib"]
  gem.version       = '1.0.0'
end
