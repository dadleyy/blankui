locations = require "./locations"

common =
  files: [{
    expand: true
    cwd: "#{locations.source}/jade"
    src: ["index.jade"]
    dest: locations.out
    ext: ".html"
  }, {
    expand: true
    cwd: "#{locations.source}/jade"
    src: ["views/**/*.jade", "components/**/*.jade"]
    dest: "#{locations.temp}/templates"
    ext: ".html"
  }]

debug =
  options:
    pretty: true
  files: common.files

release =
  options:
    pretty: false
  files: common.files

config = {debug, release}

module.exports = config
