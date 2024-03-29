# Changelog
## Version 2
### Version 2.0.7
* Update Oj to version 3.12

### Version 2.0.6
* Update Oj to version 3.11

### Version 2.0.5
* Update Oj to version 3.10

### Version 2.0.4
* Update Oj to version 3.9

### Version 2.0.3
* Update Oj to version 3.8

### Version 2.0.2
* Update Rainbow to version 3, use its new refinements in CLI
* Update Oj to version 3.7

### Version 2.0.1
* Update StringUtility to version 3

### Version 2.0.0
* Complete rewrite of the gem. Includes the following changes:
  * SimpleGeolocator is no longer a helper module containing methods for every type of data. Now, you call the 
  `SimpleGeolocator#get` function, which returns an IPAPIResponse object. This object has instance attributes to 
  replace almost all of the old SimpleGeolocator module functions. The exception to this is connection, which has 
  been replaced by the `IPAPIResponse#mobile?` and `IPAPIResponse#proxy?` functions.
  * Proper error handling has been introduced. Functions will no longer return error strings. Now, 
  `IPAPIResponse#initialize` fails with the according errors, to quickly alert the developer or user that something 
  has gone wrong.
  * `zip` is no longer an Integer, because that implies that some math should be done on it. It is a String now. You 
  can call `#to_i` if you for some reason want it to be an Integer.
  * Region (`#region`) and country (`#country`) are now represented by a LOCATION_STRUCT Struct, which has 2 instance 
  attributes: name and code.
  * Longitude and latitude (`#ll`) are no longer represented as an array, but a Pair from the data_types gem. This 
  makes significantly more conceptual sense.
  * `#isp_name` and `#organization_name` are now represented by the new named `isp` and `organization` instance 
  attributes.
* Changes to the libraries and requirements:
  * HTTPClient is no longer used. It had largely too much overhead for a gem this simple. When we do not need 
  keepalive, complicated requests, or even just a "full" client, I found it didn't make sense to use it.  Now, Curb 
  is used.
  * The stdlib JSON library is not used anymore. It has been replaced by Optimized JSON (Oj) for performance reasons.
  * data_types is now a library used by SimpleGeolocator.
  * Pessimistic version requirements are now used.

## Version 1
### Version 1.3.2
* License as MIT

### Version 1.3.1
* Update to Ruby 2.3 and HTTPClient 2.7

### Version 1.3.0
* New CLI called 'simplegeo'. Simply pass it an IP and it'll give you data!

### Version 1.2.0
* Implement a simple cache that will prevent you ever exceeding the request quota! (vladc)
* New method connection for getting the types of connection you have (proxy and/or mobile) (vladc)

### Version 1.1.0
* Fix error method causing NoMethodError.
* Better documentation for all methods, including adding the missing documentation for the private error method.
* Case/When statement instead of if conditional in request_successful?
* Better code in all the getter methods, improving how values are returned and how error is called.
* New get_error_description for getting the description to go with the ambiguous error message.
* Better error code, which is now dependent on request_successful?, instead of having getter methods being dependent on request_successful?. This greatly reduces the length of the methods.
* HTTPClient dependency is no longer open-ended.

### Version 1.0.0
* Initial release version. Contains methods for most everything available with IP-API.com. The only API that I am not utilizing is the DNS API. That should come in a future release.
