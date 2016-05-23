define [
  "services/defer"
], (Defer) ->

  path = "/login"
  view = "views/login"

  {path, view, guest: true}
