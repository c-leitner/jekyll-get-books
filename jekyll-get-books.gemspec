lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "jekyll-get-books/version"
Gem::Specification.new do |s|
    s.name        = 'jekyll-get-books'
    s.version     = JekyllGetJson::VERSION
    s.summary     = "Fetch and safe meta information for books from the Google Book API for a Jekyll Site."
    s.description = "Fetch and safe meta information for books from the Google Book API for a Jekyll Site."
    s.authors     = ["Clemens Leitner"]
    s.email       = 'clemens@velocit.at'
    s.files       = `git ls-files -z`.split("\x0").reject { |f| f.match(%r!^(test|spec|features)/!)  }
    s.require_paths = ["lib"]
    s.homepage    = 'https://github.com/brockfanning/jekyll-get-json'
    s.license       = 'MIT'
    s.add_dependency "jekyll", ">= 3.0"
  end