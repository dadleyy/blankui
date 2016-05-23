locations = require "./locations"
sass = require "node-sass"
bluebird = require "bluebird"
{extend} = require "lodash"

defer = ->
  deferred = {}

  store = (resolve, reject) ->
    deferred.resolve = resolve
    deferred.reject = reject

  deferred.promise = new bluebird store

  deferred

module.exports = (grunt) ->
  common =
    include: [
      "#{locations.bower}/foundation-sites/scss"
      "#{locations.bower}/sass-bem"
    ]
    files: [{
      expand: true
      ext: ".css"
      cwd: "#{locations.source}/sass"
      src: ["app.sass"]
      dest: "#{locations.out}/css"
    }]

  release =
    options:
      include: common.include
      style: "compressed"
      comments: false
    files: common.files

  debug =
    options:
      include: common.include
      style: "nested"
      comments: true
    files: common.files

  grunt.registerMultiTask "sass", "compiles sass sheets", ->
    done = @async()
    groups = @files
    {options} = @data

    renderList = (group) ->
      {resolve, reject, promise} = defer()
      {src, dest} = group

      if src.length != 1
        return reject new Error "too many files. each \"dest\" should only have one source"

      file = src[0]
      unless grunt.file.exists file
        return reject new Error "unable to find #{file}"

      rendered = (err, result) ->
        return reject new Error err if err
        grunt.file.write dest, result.css
        grunt.log.ok "compiled [#{file}] to [#{dest}]"
        resolve true

      config = extend {file},
        includePaths: options.include ? []
        outputStyle: options.style ? "compressed"
        sourceComments: options.comments is true

      sass.render config, rendered
      promise

    promises = (renderList g for g in groups)

    finished = ->
      grunt.log.success "finished"
      done()

    failed = (e) ->
      grunt.log.error "failed #{e.message}"
      done?()
      done = false

    bluebird.all promises
      .then finished
      .catch failed

  {debug, release}
