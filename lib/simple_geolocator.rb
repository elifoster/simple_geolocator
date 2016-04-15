require 'curb'
require 'oj'
require 'data_types/pair'
require_relative 'simple_geolocator/ipapi_response'

module SimpleGeolocator
  module_function

  @cache = {}

  URL_FORMAT = 'http://ip-api.com/json/%s?fields=258047'.freeze

  # Gets the full response. From here, all the data related to the IP can be accessed. Caches the result in order to
  #   prevent reaching the rate limit.
  # @param ip [String] The IP to get data for.
  # @return [IPAPIResponse] The full parsed response object.
  def get(ip)
    return @cache[ip] if @cache.key?(ip)
    url = format(URL_FORMAT, ip)
    response = Curl.get(url).body_str
    ipapi = SimpleGeolocator::IPAPIResponse.new(Oj.load(response))
    @cache[ip] = ipapi
  end
end
