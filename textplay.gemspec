Gem::Specification.new do |s|
  s.name = "textplay"
  s.version = "0.1.0"
  s.authors = ["Oliver Taylor"]
  s.email = %w( otaylor@me.com )
  s.homepage = "http://github.com/olivertaylor/Textplay"
  s.summary = "Textplay is a simple ruby script that converts screenplays written in Fountain formatted plain-text to a variety of useful formats."
  s.description = "Textplay is a simple ruby-script (one file, no dependancies) that converts screenplays written in Fountain formatted plain-text to a variety of useful formats: HTML, FDX (Final Draft), or PDF (PrinceXML required)."
  s.licenses = %w(MIT)

  s.platform = Gem::Platform::RUBY
  s.has_rdoc = false

  s.executables << 'textplay'
  s.files = %w(LICENSE README.md)
end
