locations = require "./locations"
express = require "express"
bluebird = require "bluebird"

defer = ->
  deferred = {}
  save = (fns...) ->
    [deferred.resolve, deferred.reject] = fns

  deferred.promise = new bluebird save
  deferred

module.exports = (grunt) ->
  index = (req, res) ->
    res.sendFile "#{locations.out}/index.html"


  lift = (app) ->
    {promise, resolve, reject} = defer()
    app.use express.static locations.out
    app.get "*", index
    resolve true
    promise

  develop =
    options:
      port: 8080
      before: lift

  grunt.registerMultiTask "server", "run a webserver for developing locally", ->
    done = @async()
    {options} = @data
    port = options.port ? 1337

    app = express()

    lifted = ->
      app.listen port
      grunt.log.ok "lifted express server on port [#{port}]"
      done()

    failed = (e) ->
      grunt.log.error e
      done()

    options.before? app
      .then lifted
      .catch failed

  {develop}
