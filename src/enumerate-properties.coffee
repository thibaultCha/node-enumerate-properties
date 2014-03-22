module.exports =
  ###
   * # enumerate(object, callback)
   *
   * Enumerates properties in a JSON object and callback
   * each as a dot notation format
   *
   * @param {Object} object The object on which to iterate
   * @param {Function} callback Callback function for each property
  ###
  enumerate: (object, callback) ->
    walk = ((obj, stack) ->
      stack = stack || ''
      return true if typeof obj isnt 'object'
      for prop,val of obj
        if walk val, stack + '.' + prop
          str = ''
          if stack
            str = stack.substring(1) + '.'
          str += prop
          callback str, val
      return false
    )
    walk(object)

  ###
   * # getAtPath(object, path)
   *
   * Retrieve nested value from a JSON object given
   * the dot notation of it's property
   *
   * @param {Object} object The object on which to get a value
   * @param {String} path Dot notation of the property to get
   * @return {* | null}
  ###
  getAtPath: (object, path) ->
    return null if path is null
    props = path.split '.'
    for i in props
      return null if !object or typeof object isnt 'object'
      object = object[i]
    return null if object is undefined
    object

  ###
   * # setAtPath(object, path, value)
   *
   * Set nested value of a JSON object to the given
   * dot notation path
   *
   * @param {Object} object The object on which to set
   * @param {String} path Dot notation of the property to set
   * @param {*} value Value to set
  ###
  setAtPath: (object, path, value) ->
    parts = path.split '.'
    len   = parts.length - 1
    for i in [0...len]
      if !object[parts[i]]
        object[parts[i]] = {}
      object = object[parts[i]]
    object[parts[len]] = value
