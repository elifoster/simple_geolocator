# simple_geolocator
[![Gem Version](https://badge.fury.io/rb/simple_geolocator.svg)](https://badge.fury.io/rb/simple_geolocator)
[![Gem Downloads](https://img.shields.io/gem/dt/simple_geolocator.svg?maxAge=2592000)]()
[![Gemnasium](https://img.shields.io/gemnasium/elifoster/simple_geolocator.svg?maxAge=2592000)]()

A simple Geolocating Ruby Gem utilizing IP-API.com.

## Installation
### RubyGems
```
gem install simple_geolocator
```

### Bundler
Add this line to application's Gemfile:

``` ruby
gem('simple_geolocator')
```

And then execute:
```
$ bundle
```

## Usage
You can use it in your code as described in the documentation. Or, if you wanna have some real fun, you can use the fancy command line interface added in version 1.3.0!

```
$ simplegeo <ip>
```

It uses the wonderful [Rainbow Gem](https://github.com/sickill/rainbow) to color the text, along with the [StringUtility Gem](https://github.com/elifoster/string-utility-ruby) to create spectacular colors. Here is an example output, without colors :cry: :

```
$ simplegeo 1.45.124.123
Here is the data for 1.45.124.123:
ISP: Beijing CheeryZone Scitech Co.,Ltd
Organization: Beijing CheeryZone Scitech Co.,Ltd
Timezone: Asia/Shanghai
Location: Beijing, Beijing Shi, China, 0
Exact location: 39.9289, 116.3883
```

Also note that this IP is not some significant person as far as I know; I literally just typed in random numbers when writing this README.

## Documentation
Please see the [RubyDocs](http://www.rubydoc.info/gems/simple_geolocator).
