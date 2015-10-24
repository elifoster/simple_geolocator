require 'httpclient'
require 'json'

module SimpleGeolocator
  extend self

  @client = HTTPClient.new
  @cache = Hash.new

  # Gets the full JSON response, useful for getting multiple pieces of data in
  #   a single request.
  # @param ip [String] The IP to get data for.
  # @return [JSON] A parsed JSON object containing the response.
  def get_full_response(ip)
    return @cache[ip] unless @cache[ip].nil?
    url = "http://ip-api.com/json/#{ip}?fields=258047"
    uri = URI.parse(url)
    response = @client.get(uri)
    @cache[ip] = JSON.parse(response.body)
  end

  # Gets whether the request failed or not.
  # @param response [JSON] The parsed response body (#get_full_response) to
  #   check.
  # @return [Boolean] True if successful, false if errored.
  def request_successful?(response)
    case response['status']
    when 'success'
      true
    when 'fail'
      false
    end
  end

  # Gets the country data for the IP.
  # @param ip [String] See #get_full_response
  # @return [Hash] A hash containing data formatted as
  #   { :name => 'United States', :code => 'US' }
  # @return [String] A string containing the error message.
  def country(ip)
    response = get_full_response(ip)
    err = error(response)
    return err unless err.nil?
    ret = {
      name: response['country'],
      code: response['countryCode']
    }
    ret
  end

  # Gets the region data for the IP.
  # @param ip [String] See #get_full_response
  # @return [Hash] A hash containing data formatted as
  #   { :name => 'Oregon', :code => 'OR'}
  # @return [String] A string containing the error message.
  def region(ip)
    response = get_full_response(ip)
    err = error(response)
    return err unless err.nil?
    ret = {
      name: response['regionName'],
      code: response['region']
    }
    ret
  end

  # Gets the city name for the IP.
  # @param ip [String] See #get_full_response
  # @return [String] The name of the city that the IP is located in.
  # @return [String] A string containing the error message.
  def city(ip)
    response = get_full_response(ip)
    err = error(response)
    return err unless err.nil?

    response['city']
  end

  # Gets the zip code for the IP.
  # @param ip [String] See #get_full_response
  # @return [Int] The zip code that the IP is located in.
  # @return [String] A string containing the error message.
  def zip(ip)
    response = get_full_response(ip)
    err = error(response)
    return err unless err.nil?

    response['zip'].to_i
  end

  # Gets the latitude, longitude for the IP.
  # @param ip [String] See #get_full_response
  # @return [Array] An array of Floats formatted as lat, lon
  # @return [String] A string containing the error message.
  def ll(ip)
    response = get_full_response(ip)
    err = error(response)
    return err unless err.nil?

    ret = [response['lat'], response['lon']]
    ret
  end

  # Gets the timezone for the IP.
  # @param ip [String] See #get_full_response
  # @return [String] The timezone (UTC, PST, etc.) that the IP is in.
  # @return [String] A string containing the error message.
  def timezone(ip)
    response = get_full_response(ip)
    err = error(response)
    return err unless err.nil?

    response['timezone']
  end

  # Gets the name of the IP's Internet Service Provider.
  # @param ip [String] See #get_full_response
  # @return [String] The ISP name, such as Comcast Cable.
  # @return [String] A string containing the error message.
  def isp_name(ip)
    response = get_full_response(ip)
    err = error(response)
    return err unless err.nil?

    response['isp']
  end

  # Gets the name of the IP's organization. For most people, this is identical
  #   to their ISP name.
  # @param ip [String] See #get_full_response
  # @return [String] The organization name, such as Google.
  # @return [String] A string containing the error message.
  def organization_name(ip)
    response = get_full_response(ip)
    err = error(response)
    return err unless err.nil?

    response['org']
  end

  # Gets the IP connection attributes - if it's a mobile and/or a proxy connection
  # @param ip [String] See #get_full_response
  # @return [Hash] A hash containing data formatted as
  #   { :mobile => true, :proxy => true}
  # @return [String] A string containing the error message.
  def connection(ip)
    response = get_full_response(ip)
    err = error(response)
    return err unless err.nil?
    ret = {
      mobile: response['mobile'],
      proxy: response['proxy']
    }
    ret
  end

  # Gets the according description for the semi-ambiguous error returned by the
  #   API.
  # @param error [String] The error message returned by #error
  # @return [String] The error description.
  # @return [Nil] If you provided an invalid error message.
  def get_error_description(error)
    case error
    when 'private range'
      return 'The IP address is part of a private range.'
    when 'reserved range'
      return 'The IP address is part of a reserved range.'
    when 'invalid query'
      return 'The IP address or domain name is invalid.'
    when 'quota'
      return 'You have reached the quota.'
    else
      return nil
    end
  end

  private

  # Gets the error message from a response.
  # @param response [JSON] See #request_successful?
  # @return [String] The error message.
  # @return [Nil] If there was no error message to begin with.
  def error(response)
    return response['message'] unless request_successful?(response)
    nil
  end
end
