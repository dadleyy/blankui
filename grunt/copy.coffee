locations = require "./locations"

escape = (s) ->
  single = s.replace /\n/g, ""
  single.replace /\"/g, "\\\""

templates =
  options:
    process: (source, source_path) ->
      """define([], function() {
        return \"#{escape source}\";
      });
      """
  files: [{
    expand: true
    cwd: "#{locations.temp}/templates"
    src: ["**/*.html"]
    dest: "#{locations.out}/templates"
    ext: ".js"
  }]

module.exports = {templates}
