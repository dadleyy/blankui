locations = require "./locations"

debug =
  options:
    bare: true
  files: [{
    expand: true
    cwd: "#{locations.source}/js"
    dest: "#{locations.temp}/js"
    src: ["**/*.coffee"]
    ext: ".js"
  }]

module.exports = {debug}
