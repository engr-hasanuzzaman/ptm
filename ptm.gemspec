# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ptm/version'

Gem::Specification.new do |spec|
  spec.name          = 'ptm'
  spec.version       = Ptm::VERSION
  spec.authors       = ['engr-hasanuzzaman']
  spec.email         = ['hasanuzzaman.sumon@gmail.com']

  spec.summary       = <<-DESC
    Personal task manager(ptm) is a command line application build for managing personal tasks list.'
  DESC

  spec.description = <<-DESCRIPTION
  Personal task manager(ptm) is a command line application implemented in Ruby using Thor. Using this app you can manage
  your task list, like add new task, make complete existing task, remove task etc. Please visit homepage for knowing
  about available functionality.
  DESCRIPTION
  spec.homepage      = 'https://github.com/engr-hasanuzzaman/ptm'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'pry', '~> 0.10.4'

  # runtime dependency
  spec.add_dependency 'thor', '~> 0.19.4'
  spec.add_dependency 'httparty', '~> 0.14.0'
  spec.add_dependency 'rainbow', '~> 2.2.2'
end
