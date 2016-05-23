define [
  "routes"
  "services/auth"
  "services/defer"
  "services/viewport"
], (routes, Auth, Defer, Viewport) ->

  # given a route definition, create a function that will be
  # called by page.js
  route = (definition) ->
    {view, guest, resolve} = definition

    unless typeof resolve == "function"
      resolve = -> Defer.resolve true

    handler = (params...) ->
      scope = {}
      resolution = null

      render = (View) ->
        view = new View {resolution}
        Viewport.render view

      success = (r) ->
        resolution = r
        require [view], render

      failed = (rejection) ->
 
      # at this point the auth module is loaded and ready
      before = ->
        {user} = Auth.session()

        if !user and !guest
          return page "/login"

        resolve.apply scope, params
          .then success
          .catch failed
     
      Auth.prepare().fin before

    handler

  # loop over every route defined by the routes module, adding 
  # a wrapped version of each one to our routing engine (page.js)
  page r.path, route r for r in routes

  page popstate: true, click: true
