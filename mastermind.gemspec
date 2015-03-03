Gem::Specification.new do |s|
  s.name         = "mastermind_kb"
  s.version      = "1.0.0"
  s.author       = "Kristina Brown"
  s.email        = "kristina.frey.frey@gmail.com"
  s.homepage     = "https://github.com/kristinabrown/mastermind"
  s.summary      = "The game Mastermind."
  s.description  = File.read(File.join(File.join(File.dirname(__FILE__),'README'))
  s.licenses     = ['MIT']

  s.files         = Dir["{lib,test}/**/*"] + %w(Gemfile README)
  s.test_files    = Dir["test/**/*"]
  s.executables   = [ 'mastermind' ]

  s.required_ruby_version = '>=1.9'
  s.add_development_dependency 'minitest' 'colorize' 'cheerio'
end
