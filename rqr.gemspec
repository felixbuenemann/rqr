Gem::Specification.new do |s|
  s.name = %q{rqr}
  s.version = "0.2.9"
  s.authors = ["Ryota Maruko", "zzzhc", "Felix Buenemann"]
  s.date = Time.now.utc.strftime("%Y-%m-%d")
  s.email = %q{pools _at_ rubyforge _dot_ org}
  s.extensions = ["ext/rqr/extconf.rb"]
  s.extra_rdoc_files = [
  ]
  s.files = `git ls-files`.split("\n")
  s.homepage = %q{http://github.com/felixbuenemann/rqr}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib", "ext"]
  s.rubygems_version = %q{1.4.2}
  s.summary = %q{A ruby library to create qrcode. Output: PS, JPEG, PNG, EPS, TIFF, SVG.}
  s.test_files = `git ls-files spec examples`.split("\n")
end
