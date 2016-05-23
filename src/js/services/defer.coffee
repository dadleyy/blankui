define [
], () ->

  Defer = ->
    deferred = {}

    store = (resolve, reject) ->
      deferred.resolve = resolve
      deferred.reject = reject

    deferred.promise = Q.promise store
  
    deferred

  Defer.resolve = (x) -> Q.resolve x

  Defer
