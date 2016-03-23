Gem::Specification.new do |s|
  s.authors = ['Eli Foster']
  s.name = 'simple_geolocator'
  s.summary = 'A Ruby gem for easily using the IP-API.com API to perform ' \
              'IP geolocation.'
  s.version = '1.3.2'
  s.license = 'MIT'
  s.description = 'Accessing the IP API through HTTPClient. I found that many' \
                  ', if not all, Geolocation gems were very annoying and ' \
                  'overly-complex to use. Thus, this gem was born. It ' \
                  'does not use anything like Google or Yahoo! Geolocation ' \
                  'because I have found that those APIs are unpredictable ' \
                  'and often-times broken. This Gem has been made to be as ' \
                  'simple to use as possible. It also includes a CLI that can' \
                  ' be called simple as \'simplegeo\' followed by the IP.'
  s.email = 'elifosterwy@gmail.com'
  s.homepage = 'https://github.com/elifoster/simple_geolocator'
  s.metadata = {
    'issue_tracker' => 'https://github.com/elifoster/simple_geolocator/issues'
  }
  s.files = [
    'CHANGELOG.md',
    'lib/simple_geolocator.rb',
    'bin/simplegeo'
  ]
  s.executables = 'simplegeo'
  s.add_runtime_dependency('rainbow', '2.0.0')
  s.add_runtime_dependency('string-utility', '>= 2.5.0')
  s.add_runtime_dependency('httpclient', '~> 2.6', '>= 2.6.0.1')
end
