locations = require "./locations"

release =
  files: [{
    expand: true
    cwd: "#{locations.out}/vendor"
    src: ["bundle.js"]
    ext: ".min.js"
    dest: "#{locations.out}/vendor"
  }]

module.exports = {release}
