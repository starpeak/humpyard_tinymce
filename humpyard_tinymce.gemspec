# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = 'humpyard_tinymce'
  s.summary = 'Use TinyMCE as Editor in Humpyard CMS.'
  s.description = 'Use TinyMCE as Editor in Humpyard CMS.'
  s.authors = ["Sven G. Broenstrup"]
  s.email = 'info@spom.net'
  s.homepage = %q{http://humpyard.org/}
  s.files = Dir["lib/**/*"] + Dir["app/**/*"] + Dir["config/**/*"] + Dir["db/migrate/*"], ["MIT-LICENSE", "README.rdoc"]
  #s.add_dependency 'digestion', '>= 1.1'
  s.add_dependency 'humpyard', '>= 0.1.0'
  s.add_dependency 'RedCloth', '>=4.2.3'
  s.add_dependency 'jquery-rails'
  s.version = "0.1.0"
end
