define [
  "services/defer"
], (Defer) ->

  session = {}

  Auth = {}

  Auth.session = -> session

  Auth.prepare = ->
    {promise, reject, resolve} = Defer()

    reject true

    promise

  Auth
