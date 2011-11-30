# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "omniauth-youtube/version"

Gem::Specification.new do |gem|
  gem.name        = "omniauth-youtube"
  gem.version     = Omniauth::YouTube::VERSION
  gem.authors     = ["Benjamin Fritsch"]
  gem.email       = ["ben@lomography.com"]
  gem.homepage    = "https://github.com/lomography/omniauth-youtube"
  gem.description = %q{OmniAuth strategy for YouTube}
  gem.summary     = gem.description

  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'omniauth-oauth', '~> 1.0'

  gem.required_rubygems_version = Gem::Requirement.new('>= 1.3.6') if gem.respond_to? :required_rubygems_version=
end
