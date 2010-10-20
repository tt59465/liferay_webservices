require 'rubygems'
require 'rake'

#require File.join(File.dirname(__FILE__), 'lib', '*.rb')

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "liferay_webservices"
    gem.summary = %Q{The missing wrapper for liferay webservices}
    gem.description = %Q{The missing wrapper for liferay webservices}
    gem.email = "ornelas.tulio@gmail.com"
    gem.homepage = "http://github.com/tulios/liferay_webservices"
    gem.authors = ["Túlio Ornelas"]                       
    gem.files = FileList["{config,lib}/**/*"]
    gem.add_dependency "savon", ">= 0.7.8"
    gem.add_dependency "activesupport", ">= 3.0.0"
    gem.add_dependency "proxy_machine", ">= 0.0.3"
    gem.add_dependency "nokogiri", ">= 1.4.3.1"
    gem.add_dependency "open-uri"
    
    gem.add_development_dependency "rspec", ">= 1.2.9"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/test_*.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :test => :check_dependencies

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "liferay_webservices #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
