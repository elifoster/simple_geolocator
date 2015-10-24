# Changelog
## Version 1
### Version 1.1.0
* Fix error method causing NoMethodError.
* Better documentation for all methods, including adding the missing documentation for the private error method.
* Case/When statement instead of if conditional in request_successful?
* Better code in all the getter methods, improving how values are returned and how error is called.
* New get_error_description for getting the description to go with the ambiguous error message.
* Better error code, which is now dependent on request_successful?, instead of having getter methods being dependent on request_successful?. This greatly reduces the length of the methods.
* HTTPClient dependency is no longer open-eneded.

### Version 1.0.0
* Initial release version. Contains methods for most everything available with IP-API.com. The only API that I am not utilizing is the DNS API. That should come in a future release.
