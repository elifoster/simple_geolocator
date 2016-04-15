# noinspection RubyTooManyInstanceVariablesInspection
module SimpleGeolocator
  class IPAPIResponse
    # @return [Hash<String, Any>] The full parsed response given by the API.
    attr_reader :full_response

    # @return [LOCATION_STRUCT] The country name and code.
    attr_reader :country

    # @return [LOCATION_STRUCT] The region name and code.
    attr_reader :region

    # @return [String] The name of the city.
    attr_reader :city

    # @return [String] The zip code.
    attr_reader :zip

    # @return [Pair<Float, Float>] The pair of the longitude and latitude.
    attr_reader :ll

    # @return [String] The name of the timezone, e.g., America/Los Angeles.
    attr_reader :timezone

    # @return [String] The name of the ISP that the IP is using.
    attr_reader :isp

    # @return [String] The name of the organization that the IP is within, or their ISP name.
    attr_reader :organization

    # A simple struct that stores the name and code for the location.
    # @param name [String] The name of the location.
    # @param code [String] The location code.
    LOCATION_STRUCT = Struct.new(:name, :code)

    # Creates a new IPAPIResponse object.
    # @param response [Hash] The response given by the IP API.
    # @raise [RuntimeError] When the request fails, raises a RuntimeError depending on the error message.
    def initialize(response = {})
      @full_response = response
      @status = response['status']
      if successful?
        @country = LOCATION_STRUCT.new(response['country'], response['countryCode'])
        @region = LOCATION_STRUCT.new(response['regionName'], response['region'])
        @city = response['city']
        @zip = response['zip']
        @ll = Pair.new(response['lat'], response['lon'])
        @isp = response['isp']
        @timezone = response['timezone']
        @organization = response['org']
        @mobile = response['mobile']
        @proxy = response['proxy']
      else
        case response['message']
        when 'private range'
          fail 'The IP address is part of a private range.'
        when 'reserved range'
          fail 'The IP address is part of a reserved range.'
        when 'invalid query'
          fail 'The IP address or domain name is invalid.'
        when 'quota'
          fail 'You have reached the IP API rate limit.'
        else
        end
      end
    end

    # @return [Boolean] Whether the request was successful.
    def successful?
      @status == 'success'
    end

    # @return [Boolean] Whether the IP is on a mobile device.
    def mobile?
      @mobile
    end

    # @return [Boolean] Whether the IP is on a proxy.
    def proxy?
      @proxy
    end
  end
end
