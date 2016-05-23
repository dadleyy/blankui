locations = require "./locations"

unit =
  basePath: locations.base
  browsers: ["PhantomJS"]
  frameworks: ["jasmine-ajax", "jasmine"]
  files: [{
    expand: true
    cwd: locations.bower
    src: [
      "requirejs/require.js"
    ]
    included: true
  }, {
    expand: true
    cwd: "#{locations.temp}/js"
    src: ["**/*.js"]
    included: false
  }, {
    expand: true
    cwd: "#{locations.test}/unit"
    src: ["main.js"]
    included: true
  }, {
    expand: true
    cwd: "#{locations.test}/unit"
    src: ["**/*.spec.coffee"]
    included: false
  }]
  preprocessors: {"**/*.coffee": ["coffee"]}
  autoStart: false
  singleRun: true
  exclude: []

module.exports = {unit}
