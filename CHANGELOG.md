# Changelog
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
