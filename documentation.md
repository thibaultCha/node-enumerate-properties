

<!-- Start src/enumerate-properties.coffee -->

## enumerate(object, callback)

# enumerate(object, callback)

Enumerates properties in a JSON object and callback
each as a dot notation format

### Params:

* **Object** *object* The object on which to iterate
* **Function** *callback* Callback function called for each property

## getAtPath(object, path)

# getAtPath(object, path)

Retrieve nested value from a JSON object given
the dot notation of it's property

### Params:

* **Object** *object* The object on which to get a value
* **String** *path* Dot notation of the property to get

### Return:

* **** 

## setAtPath(object, path, value)

# setAtPath(object, path, value)

Set nested value of a JSON object to the given
dot notation path

### Params:

* **Object** *object* The object on which to set
* **String** *path* Dot notation of the property to set
* **** *value* Value to set

<!-- End src/enumerate-properties.coffee -->

