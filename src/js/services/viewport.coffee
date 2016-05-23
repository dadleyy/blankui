define [
  "views/header"
  "views/footer"
], (Header, Footer) ->

  globals =
    header: new Header()
    footer: new Footer()

  globals.mount = ->
    globals.mounted = true
    globals.header.$mount "#header"
    globals.footer.$mount "#footer"

  render = (view) ->
    globals.mount() unless globals.mounted
    view.$mount "#view"

  {render}
