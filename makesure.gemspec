# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{makesure}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Eric Waller"]
  s.date = %q{2011-02-25}
  s.description = %q{Makesure is a set of tools to define, verify and monitor systems in a unix environment. It allows you to schedule commands that constitue a system via cron (and monitors the execution of those commands), it gives you a way to verify the state of a system (and alerts you when there are problems), and it provides a simple mechanism for collecting statistics about that system.}
  s.email = %q{eric@seatgeek.com}
  s.executables = ["makesure", "makesure-runner"]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".bundle/config",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "bin/makesure",
    "bin/makesure-runner",
    "lib/makesure.rb",
    "lib/makesure/cmd.rb",
    "lib/makesure/cron.rb",
    "lib/makesure/runner.rb",
    "lib/makesure/summarize.rb",
    "lib/makesure/system.rb",
    "lib/makesure/verify.rb",
    "lib/makesure/version.rb",
    "makesure.gemspec",
    "test/helper.rb",
    "test/test_makesure.rb"
  ]
  s.homepage = %q{http://github.com/seatgeek/makesure}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Continuous (Production) Verification: Define and Monitor Systems in Ruby}
  s.test_files = [
    "test/helper.rb",
    "test/test_makesure.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<pony>, [">= 1.0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_runtime_dependency(%q<pony>, [">= 1.0"])
    else
      s.add_dependency(%q<pony>, [">= 1.0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<pony>, [">= 1.0"])
    end
  else
    s.add_dependency(%q<pony>, [">= 1.0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<pony>, [">= 1.0"])
  end
end

