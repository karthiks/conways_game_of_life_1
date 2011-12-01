# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "game_of_life"
  s.authors     = ["Karthik Sirasanagandla"]
  s.email       = ["karthiks@thoughtworks.com"]
  s.homepage    = ""
  s.summary     = %q{My first attempt to solve Game Of Life problem using TDD}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "game_of_life"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
