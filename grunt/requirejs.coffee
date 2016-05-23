locations = require "./locations"

debug =
  options:
    appDir: "#{locations.temp}/js"
    baseUrl: "./"
    modules: [{
      name: "app"
    }]
    paths:
      "templates": "#{locations.out}/templates"
    dir: "#{locations.out}/js"
    removeCombined: true
    optimize: "none"

release =
  options:
    appDir: "#{locations.temp}/js"
    baseUrl: "./"
    modules: [{
      name: "app"
    }]
    paths:
      "templates": "#{locations.out}/templates"
    dir: "#{locations.out}/js"
    removeCombined: true
    optimize: "uglify"

module.exports = {debug, release}
