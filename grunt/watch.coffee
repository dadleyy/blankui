locations = require "./locations"

scripts =
  options: {cwd: "#{locations.source}/js"}
  files: ["**/*.coffee"]
  tasks: [
    "clean:scripts"
    "coffee:debug"
    "requirejs:debug"
  ]

styles =
  options: {cwd: "#{locations.source}/sass"}
  files: ["**/*.sass"]
  tasks: [
    "clean:styles"
    "sass:debug"
  ]

jade =
  options: {cwd: "#{locations.source}/jade"}
  files: ["**/*.jade"]
  tasks: [
    "clean:index"
    "jade:debug"
    "copy:templates"
  ]

module.exports = {scripts, styles, jade}
