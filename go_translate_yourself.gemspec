# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = "go_translate_yourself"
  s.version     = "0.0.6"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Hubert Łępicki"]
  s.email       = ["hubert.lepicki@amberbit.com"]
  s.homepage    = "http://github.com/hubertlepicki/GoTranslateYourself"
  s.summary     = "Rails engine to manage translations"
  s.description = "GoTranslateYourself is engine, that you can easily integrate with your administration panel, and let your clients do the dirty work translating the site"

  s.required_rubygems_version = ">= 1.3.6"

  s.files        = Dir.glob("{app,lib}/**/*") + %w(LICENSE README.rdoc)
  s.require_path = 'lib'
end

