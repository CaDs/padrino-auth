RAKE_ROOT = __FILE__

require 'rubygems'
require 'rake/testtask'

Rake::TestTask.new(:test) do |test|
  test.libs << 'test'
  test.test_files = Dir['test/**/test_*.rb']
  test.verbose = true
end

task :default => :test
