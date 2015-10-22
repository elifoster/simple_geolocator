require 'httpclient'
require 'json'

module SimpleGeolocator
  module_function

  @client = HTTPClient.new

  # Gets the full JSON response, useful for getting multiple pieces of data in
  #   a single request.
  # @param ip [String] The IP to get data for.
  # @return [JSON] A parsed JSON object containing the response.
  def get_full_response(ip)
    url = "http://ip-api.com/json/#{ip}"
    uri = URI.parse(url)
    response = @client.get(uri)
    JSON.parse(response.body)
  end

  # Gets whether the request failed or not.
  # @param response [String] The response body (gotten by #get_full_response)
  #   to check.
  # @return [Boolean] True if successful, false if errored.
  def request_successful?(response)
    if response['status'] == 'success'
      return true
    else
      return false
    end
  end

  # Gets the country data for the IP.
  # @param ip [String] See #get_full_response
  # @return [Hash] A hash containing data formatted as
  #   { :name => 'United States', :code => 'US' }
  def country(ip)
    response = get_full_response(ip)
    if request_successful?(response)
      ret = {
        name: response['country'],
        code: response['countryCode']
      }
      return ret
    else
      return error(response)
    end
  end

  # Gets the region data for the IP.
  # @param ip [String] See #get_full_response
  # @return [Hash] A hash containing data formatted as
  #   { :name => 'Oregon', :code => 'OR'}
  def region(ip)
    response = get_full_response(ip)
    if request_successful?(response)
      ret = {
        name: response['regionName'],
        code: response['region']
      }
      return ret
    else
      return error(response)
    end
  end

  # Gets the city name for the IP.
  # @param ip [String] See #get_full_response
  # @return [String] The name of the city that the IP is located in.
  def city(ip)
    response = get_full_response(ip)
    if request_successful?(response)
      return response['city']
    else
      return error(response)
    end
  end

  # Gets the zip code for the IP.
  # @param ip [String] See #get_full_response
  # @return [Int] The zip code that the IP is located in.
  def zip(ip)
    response = get_full_response(ip)
    if request_successful?(response)
      return response['zip'].to_i
    else
      return error(response)
    end
  end

  # Gets the latitude, longitude for the IP.
  # @param ip [String] See #get_full_response
  # @return [Array] An array of Floats formatted as lat, lon
  def ll(ip)
    response = get_full_response(ip)
    if request_successful?(response)
      ret = [
        response['lat'],
        response['lon']
      ]
      return ret
    else
      return error(response)
    end
  end

  # Gets the timezone for the IP.
  # @param ip [String] See #get_full_response
  # @return [String] The timezone (UTC, PST, etc.) that the IP is in.
  def timezone(ip)
    response = get_full_response(ip)
    if request_successful?(response)
      return response['timezone']
    else
      return error(response)
    end
  end

  # Gets the name of the IP's Internet Service Provider.
  # @param ip [String] See #get_full_response
  # @return [String] The ISP name, such as Comcast Cable.
  def isp_name(ip)
    response = get_full_response(ip)
    if request_successful?(response)
      return response['isp']
    else
      return error(response)
    end
  end

  # Gets the name of the IP's organization. For most people, this is identical
  #   to their ISP name.
  # @param ip [String] See #get_full_response
  # @return [String] The organization name, such as Google.
  def organization_name(ip)
    response = get_full_response(ip)
    if request_successful?(response)
      return response['org']
    else
      return error(response)
    end
  end

  private

  def error(response)
    response['message']
  end
end
