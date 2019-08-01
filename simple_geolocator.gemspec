Gem::Specification.new do |s|
  s.authors = ['Eli Foster']
  s.name = 'simple_geolocator'
  s.summary = 'A Ruby gem for easily using the IP-API.com API to perform IP geolocation.'
  s.version = '2.0.3'
  s.license = 'MIT'
  s.description = <<EOF
Accessing the IP API through Curb. This gem has been made to be as simple to use as possible. As such, it even includes
a CLI that can be called through `simplegeo <ip>`.
EOF
  s.email = 'elifosterwy@gmail.com'
  s.homepage = 'https://github.com/elifoster/simple_geolocator'
  s.metadata = {
    'issue_tracker' => 'https://github.com/elifoster/simple_geolocator/issues'
  }
  s.files = [
    'CHANGELOG.md',
    'lib/simple_geolocator.rb',
    'lib/simple_geolocator/ipapi_response.rb',
    'bin/simplegeo'
  ]
  s.executables = 'simplegeo'
  s.add_runtime_dependency('rainbow', '~> 3')
  s.add_runtime_dependency('string-utility', '~> 3')
  s.add_runtime_dependency('curb', '~> 0.9')
  s.add_runtime_dependency('oj', '~> 3.8')
  s.add_runtime_dependency('data_types', '~> 1')
end
