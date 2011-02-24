require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
require './lib/makesure/version.rb'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "makesure"
  gem.version = Makesure::Version::STRING
  gem.homepage = "http://github.com/seatgeek/makesure"
  gem.license = "MIT"
  gem.summary = %Q{Continuous (Production) Verification: Define and Monitor Systems in Ruby}
  gem.description = %Q{Makesure is a set of tools to define, verify and monitor systems in a unix environment. It allows you to schedule commands that constitue a system via cron (and monitors the execution of those commands), it gives you a way to verify the state of a system (and alerts you when there are problems), and it provides a simple mechanism for collecting statistics about that system.}
  gem.email = "eric@seatgeek.com"
  gem.authors = ["Eric Waller"]
  gem.add_runtime_dependency 'pony', '>= 1.0'
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

require 'rcov/rcovtask'
Rcov::RcovTask.new do |test|
  test.libs << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "makesure #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
